class Public::GenresController < ApplicationController
  before_action :authenticate_customer!

  def show
    @genre = Genre.find(params[:id])
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
