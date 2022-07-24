require 'rails_helper'

RSpec.describe 'Movies Show Page' do
  it "visits the movies show page I see the movie's title, creation year, and genre" do
    studio_1 = Studio.create(id: 100, name: "Universal Studios", location: "Hollywood")
    studio_2 = Studio.create(id: 200, name: "Warner Brothers", location: "Burbank")
    
    movie_1 = Movie.create(id: 100, title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure', studio_id: studio_1.id)
    movie_2 = Movie.create(id: 200, title: 'Indiana Jones', creation_year: 1977, genre: 'Fun', studio_id: studio_1.id)
    movie_3 = Movie.create(id: 300, title: 'Avengers', creation_year: 2013, genre: 'Drama', studio_id: studio_2.id)
    movie_4 = Movie.create(id: 400, title: 'Bridget Jones Diary', creation_year: 2001, genre: 'Romance', studio_id: studio_2.id)
    
    visit "/movies/#{movie_1.id}"

    within "#movie-#{movie_1.id}" do
    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_1.creation_year)
    expect(page).to have_content(movie_1.genre)
    expect(page).to have_no_content(movie_2.title)
    expect(page).to have_no_content(movie_2.creation_year)
    expect(page).to have_no_content(movie_2.genre)
    end
  end

  it "lists all actors from youngest to oldest" do
    studio_1 = Studio.create(id: 100, name: "Universal Studios", location: "Hollywood")
    studio_2 = Studio.create(id: 200, name: "Warner Brothers", location: "Burbank")
    
    movie_1 = Movie.create(id: 100, title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure', studio_id: studio_1.id)
    movie_2 = Movie.create(id: 200, title: 'Indiana Jones', creation_year: 1977, genre: 'Fun', studio_id: studio_1.id)
    movie_3 = Movie.create(id: 300, title: 'Avengers', creation_year: 2013, genre: 'Drama', studio_id: studio_2.id)
    movie_4 = Movie.create(id: 400, title: 'Bridget Jones Diary', creation_year: 2001, genre: 'Romance', studio_id: studio_2.id)

    actor_1 = Actor.create(id: 100, name: 'Harrison Ford', age: 35)
    actor_2 = Actor.create(id: 200, name: 'Sean Connery', age: 52)
    actor_3 = Actor.create(id: 300, name: 'Robert Downey Jr.', age: 33)
    actor_4 = Actor.create(id: 400, name: 'Scarlett Johansson', age: 27)

    movie_actor_1 = MovieActor.create(movie_id: movie_1.id, actor_id: actor_1.id)
    movie_actor_2 = MovieActor.create(movie_id: movie_1.id, actor_id: actor_2.id)
    movie_actor_3 = MovieActor.create(movie_id: movie_2.id, actor_id: actor_3.id)
    movie_actor_4 = MovieActor.create(movie_id: movie_2.id, actor_id: actor_4.id)
    
    visit "/movies/#{movie_1.id}"

    within "#movie-#{movie_1.id}" do
    expect(page).to have_content("Harrison Ford")
    expect(page).to have_content("Sean Connery")
    expect("Harrison Ford").to appear_before("Sean Connery")
    expect(page).to have_no_content("Robert Downey Jr.")
    expect(page).to have_no_content("Scarlett Johansson")
    expect(page).to have_content("Average Actor Age: 43.5")
    end
  end
end


