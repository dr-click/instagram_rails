require 'rails_helper'

RSpec.describe MediaItemsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { FactoryBot.create(:user) }
  let(:current_user) {user}

  before(:each) do
    sign_in(user)
    stub_request(:get, "https://api.instagram.com/v1/users/self/media/recent.json").
         with(  headers: {
       	  'Accept'=>'application/json; charset=utf-8',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Instagram Ruby Gem 1.1.6'
           }).
         to_return(status: 200, body: File.read("#{Rails.root}/spec/factories/user_media_feed.json"), headers: {})
  end

  describe "Get Index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_success
    end

    it "returns media_item" do
      get :index, params: {}
      expect(response).to be_success
      expect(assigns(:media_items).count).to eql(21)
    end
  end
end
