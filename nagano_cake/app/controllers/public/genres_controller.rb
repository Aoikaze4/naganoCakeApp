class Public::GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
