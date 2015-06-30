class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      flash[:success] = 'Video added!'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  def destroy
  end

  def edit
  end

  private

  def video_params
    params.require(:video).permit(:link)
  end
end
