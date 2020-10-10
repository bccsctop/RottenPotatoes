class MoviesController < ApplicationController
  skip_before_action :authenticate!, only: [ :show, :index ]
  def index
    @movies = Movie.all.order('title')
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.html.haml by default
  end

  def new
    @movie = Movie.new
  end

  def create
    params.require(:movie)
    permitted = params[:movie].permit(:title, :rating, :release_date, :description)
    @movie = Movie.create!(permitted)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movie_path(@movie)
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    permitted = params[:movie].permit(:title,:rating,:release_date,:description)
    @movie.update_attributes!(permitted)

    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
