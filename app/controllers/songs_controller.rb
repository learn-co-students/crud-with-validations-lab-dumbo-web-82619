class SongsController < ApplicationController
  before_action :find_song, only: [:show, :update, :destroy, :edit]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  # THIS METHOD WORKS IN BROWSER, NOT FOR LAB TESTS
  # def create
  #   @song = Song.create(songs_params)
  #   if @song.valid?
  #     redirect_to song_path(@song)
  #   else
  #     flash[:errors] = @song.errors.full_messages
  #     redirect_to new_song_path
  #   end
  # end

  def create
    @song = Song.create(songs_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
  end

  def edit
    
  end

  # THIS METHOD WORKS IN BROWSER, NOT FOR LAB TESTS
  # def update
  #   @song.update(songs_params)
  #   if @song.valid?
  #     redirect_to song_path(@song)
  #   else
  #     flash[:errors] = @song.errors.full_messages
  #     redirect_to edit_song_path
  #   end
  # end

  def update
    @song.update(songs_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def songs_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def find_song
    @song = Song.find(params[:id])
  end

end
