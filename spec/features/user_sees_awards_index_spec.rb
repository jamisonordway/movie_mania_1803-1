require 'rails_helper'

describe 'User visits awards index' do
  context 'as visitor' do
    it 'should show all awards as links to award show page' do
    award_1 = Award.create(name: 'Best cast')
    award_2 = Award.create(name: 'Most likely to bomb at box office')

    visit awards_path
    #save_and_open_page
    expect(page).to have_link(award_1.name)
    expect(page).to have_link(award_2.name)
    end
    it 'should have award name on award show page' do
    award_3 = Award.create(name: 'Silliest script')

    visit awards_path
    
    click_on "#{award_3.name}"
    expect(current_path).to eq(award_path(award_3))
    expect(page).to have_content(award_3.name)
    end
  end
end
