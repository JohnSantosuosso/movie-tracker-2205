# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    Studio.destroy_all
    Movie.destroy_all
    Actor.destroy_all
    MovieActor.destroy_all

    studio_1 = Studio.create(name: "Universal Studios", location: "Hollywood")
    studio_2 = Studio.create(name: "Warner Brothers", location: "Burbank")
    
    movie_1 = Movie.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure', studio_id: studio_1.id)
    movie_2 = Movie.create(title: 'Indiana Jones', creation_year: 1977, genre: 'Action/Adventure', studio_id: studio_1.id)
    movie_3 = Movie.create(title: 'Avengers', creation_year: 2013, genre: 'Action/Adventure', studio_id: studio_2.id)
    movie_4 = Movie.create(title: 'Bridget Jones Diary', creation_year: 2001, genre: 'Romance', studio_id: studio_2.id)

    actor_1 = Actor.create(id: 100, name: 'Harrison Ford', age: 35)
    actor_2 = Actor.create(id: 200, name: 'Sean Connery', age: 52)
    actor_3 = Actor.create(id: 300, name: 'Robert Downey Jr.', age: 33)
    actor_4 = Actor.create(id: 400, name: 'Scarlett Johansson', age: 27)

    movie_actor_1 = MovieActor.create(movie_id: movie_1.id, actor_id: actor_1.id)
    movie_actor_2 = MovieActor.create(movie_id: movie_1.id, actor_id: actor_2.id)
    movie_actor_3 = MovieActor.create(movie_id: movie_2.id, actor_id: actor_3.id)
    movie_actor_4 = MovieActor.create(movie_id: movie_2.id, actor_id: actor_4.id)
