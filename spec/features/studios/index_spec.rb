require 'rails_helper'

RSpec.describe 'Studios Index Page' do
  it "visits the studios index page and sees see a each studio's name and location and each studios movies" do
    studio_1 = Studio.create(name: "Universal Studios", location: "Hollywood")
    studio_2 = Studio.create(name: "Warner Brothers", location: "Burbank")
    
    movie_1 = Movie.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure', studio_id: studio_1.id)
    movie_2 = Movie.create(title: 'Indiana Jones', creation_year: 1977, genre: 'Action/Adventure', studio_id: studio_1.id)
    movie_3 = Movie.create(title: 'Avengers', creation_year: 2013, genre: 'Action/Adventure', studio_id: studio_2.id)
    movie_4 = Movie.create(title: 'Bridget Jones Diary', creation_year: 2001, genre: 'Romance', studio_id: studio_2.id)
    
    visit '/studios'

    within "#studio-#{studio_1.id}" do
      expect(page).to have_content("Universal Studios")
      expect(page).to have_content("Hollywood")
      expect(page).to have_content("Raiders of the Lost Ark")
      expect(page).to have_content("Indiana Jones")
      expect(page).to have_no_content("Avengers")
      expect(page).to have_no_content("Bridget Jones Diary")
    end

    within "#studio-#{studio_2.id}" do
      expect(page).to have_content("Warner Brothers")
      expect(page).to have_content("Burbank")
      expect(page).to have_content("Avengers")
      expect(page).to have_content("Bridget Jones Diary")
      expect(page).to have_no_content("Raiders of the Lost Ark")
      expect(page).to have_no_content("Indiana Jones")
    end
  end
end