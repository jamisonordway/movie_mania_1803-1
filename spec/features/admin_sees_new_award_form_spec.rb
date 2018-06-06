require 'rails_helper'

describe "User visits award index page" do
  context "As admin" do
    it 'should allow admin to create a new award' do
      admin = User.create(username: "Dee", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit awards_path

      fill_in('Name', :with => 'Best Comedy')
      click_on "Create Award"
      save_and_open_page
      expect(current_path).to eq(awards_path)
      expect(page).to have_content('Best Comedy')
    end
  end
end
