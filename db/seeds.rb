# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    studio_1 = Studio.create(id: 1, name: "Universal Studios", location: "Hollywood")
    studio_2 = Studio.create(id: 2, name: "Warner Brothers", location: "Burbank")
    
    movie_1 = Movie.create(id: 1, studio_id: 1, title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    movie_2 = Movie.create(id: 2, studio_id: 1,title: 'Indiana Jones', creation_year: 1977, genre: 'Action/Adventure')
    movie_3 = Movie.create(id: 3, studio_id: 2,title: 'Avengers', creation_year: 2013, genre: 'Action/Adventure')
    movie_4 = Movie.create(id: 4, studio_id: 2,title: 'Bridget Jones Diary', creation_year: 2001, genre: 'Romance')
