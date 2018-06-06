require 'rails_helper'

describe "User visits award index page" do
  context "As admin" do
    it 'should have a link to a new award form' do
      admin = User.create(username: "Dee", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_awards_path

      expect(page).to have_link("Create an Award")
    end
    it 'should allow admin to create a new award' do
      admin = User.create(username: "Dee", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_awards_path
      click_on "Create an Award"
      fill_in('Name', :with => 'Best Comedy')
      fill_in('Year', :with => '2009')
    end
  end
end
