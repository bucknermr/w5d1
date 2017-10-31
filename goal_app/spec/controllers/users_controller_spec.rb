require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe "GET #create" do
    context 'when the username and password are valid' do

      before(:each) do
        post :create, params: { user: { username: 'username', password: 'password' } }
      end

      let(:user) { User.find_by(username: 'username') }

      it "redirects to goals url" do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(goals_url)
      end

      it 'creates a user' do
        expect(user).to_not be_nil
      end

      it 'logs in' do
        expect(session[:session_token]).to eq(user.session_token)
      end
    end

    context 'when the username and password are not valid' do

      before(:each) do
        post :create, params: { user: { username: 'username', password: nil } }
      end

      it 'renders the new template' do
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:new)
      end

      it "saves the errors" do
        expect(flash[:errors]).to_not be_nil
      end

    end
  end

  describe "GET #show" do

    let(:user) { FactoryBot.create(:user) }

    it "renders the show template sir" do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

end
