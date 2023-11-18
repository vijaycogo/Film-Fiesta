# app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    if params[:search].present?
      @movies = TmdbService.search_movies(params[:search])
    else
      @movies = TmdbService.get_latest_movies
    end
  end

  def show
    @movie = TmdbService.get_movie_details(params[:id])
  end

  def add_to_favorites
    # Logic to add the movie to favorites
    # You can use session or any other mechanism to store favorite movies
    movie_id = params[:id]

    # Initialize the session[:favorite_movies] array if it's not set
    session[:favorite_movies] ||= []
    # Check if the movie_id is not already in favorites
    unless session[:favorite_movies].include?(movie_id)
      session[:favorite_movies] << movie_id
    end
    redirect_back(fallback_location: root_path, notice: 'Movie added to favorites!')

    # redirect_to movie_path(movie_id), notice: 'Added to favorites'
  end

  def destroy_favorite
    movie_id = params[:id]
    session[:favorite_movies]&.delete(movie_id)
    session[:favorite_movies].compact.uniq
    redirect_to favorites_movies_path, notice: 'Removed from favorites'
  end

  def favorites
    @favorite_movies=[]
    session[:favorite_movies].compact.uniq.each do |movie_id|
      @favorite_movies <<  TmdbService.get_movie_details(movie_id)
    end
  end
end
