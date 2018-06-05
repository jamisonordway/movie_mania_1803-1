require 'rails_helper'

context 'Admin user' do
  describe 'they navigate to genres index' do
    it 'should show a list of all genres in database' do
      director = Director.create(name: 'Sam Raimi')
      movie = director.movies.create(title: 'Evil Dead', description: 'boom stick')
      genre_1 = movie.genres.create(name: 'Horror')
      genre_2 = movie.genres.create(name: 'Comedy')

      visit genres_path
      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
    end
  end
end
