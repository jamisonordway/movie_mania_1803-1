require 'rails_helper'

describe 'User visits award show' do
  context 'as visitor' do
    it 'should show all the movies which received this award and the year it was received' do
      award_1 = Award.create(name: 'Most Realistic Gore')
      movie_1 = Movie.create(title: 'SAW III', description: 'because 2 wasnt enough')
      movie_2 = Movie.create(title: 'House of Wax', description: 'the guy from supernatural melts its pretty cool')
      movie_award_1 = award_1.movie_awards.create(award_id: award_1.id, movie_id: movie_1.id, year: '2011')
      movie_award_2 = award_1.movie_awards.create(award_id: award_1.id, movie_id: movie_2.id, year: '2005')

      visit award_path(award_1)
      #save_and_open_page
  
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_2.title)
      expect(page).to have_content(movie_award_1.year)
      expect(page).to have_content(movie_award_2.year)
    end
  end
end
