require 'rails_helper'

RSpec.describe TeamsController, type: :controller do

  describe "GET #show" do
    context 'with valid team domain' do
      let!(:team) { create :team }

      it "returns http success" do
        get :show, params: { domain: team.domain }
        expect(response).to have_http_status(:success)
      end

      it "load the team" do
        get :show, params: { domain: team.domain }
        expect(assigns(:team)).to eq team
      end
    end

    context 'with invalid team domain' do
      it "raise error" do
        expect{ get :show, params: { domain: 'foobar' } }.to raise_error
      end
    end
  end
end
