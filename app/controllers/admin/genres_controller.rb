class Admin::GenresController < ApplicationController


  def create

    @genre = Genre.new(genre_params)
    @genre.save
    @genres = Genre.all
    render.index
  end

 def index

    @genres = Genre.all


 end

  def edit

  end

  def update

  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
