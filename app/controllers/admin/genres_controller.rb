class Admin::GenresController < ApplicationController
  def new
    @genre=genre.new
  end

  def create
    genre = genre.new(genre_params)
  end

  def index
  end


end
