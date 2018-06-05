require 'rails_helper'

context 'Admin user' do
  describe 'they navigate to genres index' do
    it 'should show a list of all genres in database' do
      admin = User.create(username: 'admin', password: 'admin', role: 1)
      director = Director.create(name: 'Sam Raimi')
      movie = director.movies.create(title: 'Evil Dead', description: 'boom stick')
      genre_1 = movie.genres.create(name: 'Horror')
      genre_2 = movie.genres.create(name: 'Comedy')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_genres_path
      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
    end
    it 'should have a link to genre new' do
      admin = User.create(username: 'admin', password: 'admin', role: 1)
      director = Director.create(name: 'Sam Raimi')
      movie = director.movies.create(title: 'Evil Dead', description: 'boom stick')
      genre_1 = movie.genres.create(name: 'Horror')
      genre_2 = movie.genres.create(name: 'Comedy')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_genres_path
      click_on "Add a Genre"
      expect(current_path).to eq(new_admin_genre_path)
      fill_in("Name", :with => 'Drama')
      
      click_on "Create"
      expect(current_path).to eq(genres_path)
    end
  end
end
