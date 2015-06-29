class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @blogs = Blog.all
  end

  def show
    # binding.pry
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.new(blog_params)
    @blog.body = @blog.body.gsub("\n", '</br>')
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    @blog.body = @blog.body.gsub("\n", '</br>')
    if blog.update(blog_params)
      redirect_to blog_path
    else
      render :edit
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body, :user_id, :id, :media)
  end
end
