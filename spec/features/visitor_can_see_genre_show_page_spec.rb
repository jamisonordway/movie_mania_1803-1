require 'rails_helper'

context 'visitor' do
  describe 'they click on a genre to go to genre page' do
    it 'should show a list of all movies associated with that genre' do
      director = Director.create!(name: 'Sam Raimi')
      movie_1 = director.movies.create!(title: 'Evil Dead', description: 'boom stick')
      movie_2 = director.movies.create!(title: 'Drag me to Hell', description: 'spoiler: the cat dies')
      genre_1 = movie_1.genres.create!(name: 'Horror')

      #binding.pry
      visit genre_path(genre_1)
      # save_and_open_page
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_2.title)
    end
  end
end
