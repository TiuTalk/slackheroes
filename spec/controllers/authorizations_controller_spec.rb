require 'rails_helper'

RSpec.describe AuthorizationsController, type: :controller do

  describe "GET #authorize" do
    it "redirects to root" do
      get :authorize
      expect(response).to redirect_to(root_path)
    end
  end
end
