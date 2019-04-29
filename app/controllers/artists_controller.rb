class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path
    else
      render :new
  end
 end

  def update
    @artist = Artist.find(params[:id])
    @artist = Artist.update(artist_params(:name, :bio))
    redirect_to artists_path
  end

  private

  def artist_params(*args)
    params.require(:artist).permit(:name, :bio)
  end
end
