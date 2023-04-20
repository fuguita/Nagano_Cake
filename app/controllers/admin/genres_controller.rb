class Admin::GenresController < ApplicationController
  
 
  
  def index
    @Genre = Genre.new
    @genres = Genre.all
  end
  
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to genres_path
  end
  
  def edit
    
  end  
  
  def update
    
  end  
  
  private
  
  def genre_params
    params.require(:genres).permit(:name)
  end
  
end
