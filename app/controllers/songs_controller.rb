class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = @artist.song
  end

  def show
  end

  def new
    @song = @artist.songs.new
  end

  def edit
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_song_path(@artist, @song)
    else
      render :new
    end
  end

  def update
    if @song.update(song_params)
      redirect_to artist_song_path(@artist, @song)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to artist_song_path
  end

  private

    def song_params
      params.require(:song).permit(:name, :body)
    end

    def set_artist
      @billboard = Artist.find(params[:artist_id])
    end

    def set_song
      @song = @artist.song.find(params[:id])
    end

end

end
