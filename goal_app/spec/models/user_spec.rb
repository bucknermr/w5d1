require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryBot.build(:user)
  end

  it { should validate_presence_of(:username) }
  # it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe '#is_password?' do
    before(:each) { user.password = 'password' }

    context 'when given a valid password' do
      it 'returns true' do
        expect(user.is_password?('password')).to be(true)
      end
    end
    context 'when given an invalid password' do
      it 'returns false' do
        expect(user.is_password?('notpassword')).to be(false)
      end
    end
  end
  describe '#ensure_session_token' do
    it 'ensures there is a session token after initialization' do
      expect(user.session_token).to_not be_nil
    end
  end
  describe '#reset_session_token!' do

    before(:each) do
      user.session_token = 'session_token'
      user.reset_session_token!
    end

    it 'changes the session token' do
      expect(user.session_token).to_not eq('session_token')
    end
    it 'persists the changes to the database' do
      u = User.find_by(username: user.username)
      expect(u.session_token).to_not eq('session_token')
    end
  end
  describe '::find_by_credentials' do

    before(:each) do
      user.save
    end

    context 'when given valid credentials' do
      it 'returns a user' do
        expect(User.find_by_credentials(user.username, user.password)).to eq(user)
      end
    end
    context 'when given invalid credentials' do
      it 'returns nil' do
        expect(User.find_by_credentials(user.username, 'incorrect')).to be_nil
      end
    end
  end

end
