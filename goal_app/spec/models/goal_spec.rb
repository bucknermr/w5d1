require 'rails_helper'

RSpec.describe Goal, type: :model do
  it { should validate_presence_of(:objective) }
  it { should validate_presence_of(:completed) }
  it { should validate_presence_of(:shared) }

  describe 'Associations' do
    it { should belong_to(:user) }
  end

end
