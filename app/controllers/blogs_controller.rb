class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new()
    if @blog.save
      redirect_to new_blog_path
    else
      render :new
    end
  end

  def edit
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body, :user_id)
  end
end
