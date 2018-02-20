require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  include Devise::Test::ControllerHelpers
  let(:valid_session) { {} }
  
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.env["omniauth.auth"] = AUTHHASH
  end

  describe "post instagram #callback" do
    it "returns a success response" do
      post :instagram, params: {}, session: valid_session
      expect(response).to redirect_to(root_path)
    end
  end
end
