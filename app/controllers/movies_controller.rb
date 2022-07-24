class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.find(params[:id])
    @actor = Actor.create!(name: params[:actor_name], age: params[:actor_age])
    @movie.actors << @actor
    redirect_to "/movies/#{@movie.id}"
  end

end