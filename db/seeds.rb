# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    Studio.destroy_all
    Movie.destroy_all

    studio_1 = Studio.create(name: "Universal Studios", location: "Hollywood")
    studio_2 = Studio.create(name: "Warner Brothers", location: "Burbank")
    
    movie_1 = Movie.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure', studio_id: studio_1.id)
    movie_2 = Movie.create(title: 'Indiana Jones', creation_year: 1977, genre: 'Action/Adventure', studio_id: studio_1.id)
    movie_3 = Movie.create(title: 'Avengers', creation_year: 2013, genre: 'Action/Adventure', studio_id: studio_2.id)
    movie_4 = Movie.create(title: 'Bridget Jones Diary', creation_year: 2001, genre: 'Romance', studio_id: studio_2.id)
