require 'rails_helper'

feature 'Guest User' do

	it "can visit homepage" do
		visit root_path
		expect(page).to have_content "Instagram Example"
	end

	it "can login with instagram" do
		authentication = FactoryBot.create(:authentication, uid: AUTHHASH[:uid], provider: AUTHHASH[:provider], token: AUTHHASH[:credentials][:token])
		visit root_path
		expect(page).to have_content "Instagram Example"
		click_link "Login with Instagram"
		expect(page).to have_content "Logout"
	end

	it "can login with instagram for first time" do
		visit root_path
		expect(page).to have_content "Instagram Example"
		click_link "Login with Instagram"
		expect(page).to have_content "Logout"
	end
end
