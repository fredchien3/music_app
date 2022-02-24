class TracksController < ApplicationController
  before_action :require_user!

  def create
    @track = Track.new(track_params)
    if @track.save!
      redirect_to track_url(@track.id)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def new
    @track = Track.new
    render :new
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    album = @track.album
    @track.destroy!
    redirect_to album_url(album)
  end

  private
  def track_params
    params.require(:track).permit(:title, :ord, :lyrics, :album_id, :bonus)
  end
end
