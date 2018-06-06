require 'rails_helper'

describe 'user_index' do
  it 'user_can_see_all_movies' do
    director = Director.create(name: "Alec Baldwin")
    movie_1 = director.movies.create(title: "Mean Girls", description: "High school girls are mean.")
    movie_2 = Movie.create!(title: "Boss Baby", description: "A baby is a boss.", director_id: director.id)
    movie_3 = Movie.create(title: "Catch Me If You Can", description: "Boy becomes expert in check fraud", director: director)
    award_1 = movie_3.awards.create(name: 'Best Kids Film')
    award_2 = movie_3.awards.create(name: 'Least Likely to be Enjoyed by Adults')

    visit '/movies'
    binding.pry
    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_1.description)
    expect(page).to have_content(movie_2.title)
    expect(page).to have_content(movie_2.description)
    expect(page).to have_content(movie_3.title)
    expect(page).to have_content(movie_3.description)
    expect(page).to have_content("Awards for this Movie: ")
    expect(page).to have_content('Least Likely to be Enjoyed by Adults')
    expect(page).to have_content('Best Kids Film')
  end
end
