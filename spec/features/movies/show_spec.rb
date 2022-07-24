require 'rails_helper'

RSpec.describe 'Movies Show Page' do
  it "visits the movies show page I see the movie's title, creation year, and genre" do
    studio_1 = Studio.create(id: 100, name: "Universal Studios", location: "Hollywood")
    studio_2 = Studio.create(id: 200, name: "Warner Brothers", location: "Burbank")
    
    movie_1 = Movie.create(id: 100, title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure', studio_id: studio_1.id)
    movie_2 = Movie.create(id: 200, title: 'Indiana Jones', creation_year: 1977, genre: 'Action/Adventure', studio_id: studio_1.id)
    movie_3 = Movie.create(id: 300, title: 'Avengers', creation_year: 2013, genre: 'Action/Adventure', studio_id: studio_2.id)
    movie_4 = Movie.create(id: 400, title: 'Bridget Jones Diary', creation_year: 2001, genre: 'Romance', studio_id: studio_2.id)
    
    visit "/movies/#{movie_1.id}"

    expect(page).to have_content(movie_1.title)

  end
end


