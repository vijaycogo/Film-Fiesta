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

  def favorites
    # Implement favorite movies logic
  end
end
