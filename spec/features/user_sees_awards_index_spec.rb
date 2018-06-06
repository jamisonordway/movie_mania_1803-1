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
  end
end
