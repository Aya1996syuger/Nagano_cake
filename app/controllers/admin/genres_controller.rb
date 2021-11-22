class Admin::GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    
    @genre.save
     redirect_to admin_genres_path(@genre)
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

 private
  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name)
  end

end
