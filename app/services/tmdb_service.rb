# app/services/tmdb_service.rb
class TmdbService
    include HTTParty
    base_uri 'https://api.themoviedb.org/3'
    default_params api_key: ENV['TMDB_API_KEY'], language: 'en-US'
    format :json
  
    def self.search_movies(query)
      get('/search/movie', query: { query: query })['results']
    end
  
    def self.get_movie_details(movie_id)
      get("/movie/#{movie_id}")
    end
  
    def self.get_latest_movies
      get('/movie/now_playing')['results']
    end

    def self.get_movies_details(favorite_movies)
      movie_id = favorite_movies.first.to_i
      get("/movie/#{movie_id}")
    end
  end
  