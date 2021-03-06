class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    if params[:commit]
      ratings = params[:ratings] || {}
    else
      ratings = session[:ratings] || {}
    end
    @selected_ratings = ratings.keys
    session[:ratings] = ratings
    @sort_by = params[:sort] || session[:sort]
    session[:sort] = @sort_by
    if (@selected_ratings.size > 0)
      @movies = Movie
          .where(:rating => @selected_ratings)
          .order(@sort_by)
    else 
      @movies = Movie
          .order(@sort_by)
    end
    @all_ratings = Movie.get_all_ratings
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
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
