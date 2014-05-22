class SongsController < ApplicationController
  before_action(:load_artist, only: [:new, :create] )
  before_action(:load_song, { only: [:edit, :update, :destroy] })

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.artist = @artist
    @song.preview_url = get_preview_url(@artist, @song)
    @song.save
    redirect_to artist_path(@artist)
  end

  def edit
  end

  def update
    @song.update(song_params)
    redirect_to artist_path(@song.artist)
  end

  def destroy
    @song.destroy
    redirect_to artist_path(@song.artist)
  end

  def search
    @songs = Song.where(title: params[:q])
  end

  private

  def load_artist
    return @artist = Artist.find_by(id: params[:artist_id])
  end

  def load_song
    return @song = Song.find_by(id: params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :year)
  end

   def get_preview_url(artist, song)
    artist = artist.name.gsub(" ", "+")
    song = song.title.gsub(" ", "+")
    response = HTTParty.get("https://itunes.apple.com/search?term=#{artist}+#{song}&media=music&entity=musicTrack&limit=1")
    response_hash = JSON(response)
    return response_hash["results"][0]["previewUrl"]
  end
end
