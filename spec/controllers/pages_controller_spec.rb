require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET #home" do
    context 'without a team' do
      it "returns http success" do
        get :home
        expect(response).to have_http_status(:success)
      end
    end

    context 'with a team' do
      let!(:team) { create(:team) }

      it 'redirect to the team page' do
        get :home
        expect(response).to redirect_to(team)
      end
    end
  end
end
