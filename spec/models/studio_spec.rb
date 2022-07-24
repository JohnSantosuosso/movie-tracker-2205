require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it { should have_many :movies }
  end

  before(:each) do
    @studio_1 = Studio.create(name: "Universal Studios", location: "Hollywood")
    @studio_2 = Studio.create(name: "Warner Brothers", location: "Burbank")
      
    @movie_1 = @studio_1.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure', studio_id: @studio_1.id)
    @movie_2 = @studio_1.movies.create(title: 'Indiana Jones', creation_year: 1977, genre: 'Action/Adventure', studio_id: @studio_1.id)
    @movie_3 = @studio_2.movies.create(title: 'Avengers', creation_year: 2013, genre: 'Action/Adventure', studio_id: @studio_2.id)
    @movie_4 = @studio_2.movies.create(title: 'Bridget Jones Diary', creation_year: 2001, genre: 'Romance', studio_id: @studio_2.id)
  end

  describe 'instance methods' do
    it "should find_all_movies" do
      expect(@studio_1.find_all_movies).to eq([@movie_1, @movie_2])
      expect(@studio_2.find_all_movies).to eq([@movie_3, @movie_4])
    end
  end
end