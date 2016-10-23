require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET #home" do
    let!(:team) { create(:team) }

    it 'render the page' do
      get :home
      expect(response).to be_ok
    end
  end
end
