require 'rails_helper'

describe Genre, type: :model do
  describe 'relationships' do
    it {should have_many(:movies).through(:genre_movies)}
  end
end
