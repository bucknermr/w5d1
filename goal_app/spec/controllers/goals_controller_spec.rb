require 'rails_helper'

RSpec.describe GoalsController, type: :controller do

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe "GET #edit" do
    it "renders the edit template" do
      get :edit
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
    end
  end

  describe "GET #update" do
    let(:user) { FactoryBot.create(:user) }
    let(:goal) { FactoryBot.create(:goal, user_id: user.id) }

    context 'valid parameters to my update' do
      it "redirects to goals_url" do
        patch :update, params: { goal: { objective: goal.objective, user_id: user.id, completed: user.completed, private: user.private} }
        expect(response).to have_http_status(:success)
        expect(response).to redirect_to(goals_url)
      end
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
