class Studio < ApplicationRecord
  has_many :movies

  def find_all_movies
    movies = Movie.all
    movies = movies.where(studio_id: self.id)
  end
end