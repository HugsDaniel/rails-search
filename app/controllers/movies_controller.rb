class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    # p "Query is : #{params[:query]}"

    # utiliser "where"
    if params[:query].present?
      # @movies = @movies.where(title: params[:query])
      # @movies = @movies.where("title = ?", params[:query])

      # @movies = @movies.where("title ILIKE ?", params[:query])

      # @movies = @movies.where("title ILIKE ?", "%#{params[:query]}%")

      # subquery = "title ILIKE :query OR synopsis ILIKE :query"
      # @movies = @movies.where(subquery, query: "%#{params[:query]}%")

      # subquery = <<~SQL
      #   movies.title ILIKE :query
      #   OR movies.synopsis ILIKE :query
      #   OR directors.first_name ILIKE :query
      #   OR directors.last_name ILIKE :query
      # SQL
      # @movies = @movies.joins(:director).where(subquery, query: "%#{params[:query]}%")

      # subquery = <<~SQL
      #   movies.title @@ :query
      #   OR movies.synopsis @@ :query
      #   OR directors.first_name @@ :query
      #   OR directors.last_name @@ :query
      # SQL
      # @movies = @movies.joins(:director).where(subquery, query: "%#{params[:query]}%")

      @movies = @movies.global_search(params[:query])
    end
  end
end
