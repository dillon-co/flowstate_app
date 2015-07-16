class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @blogs = Blog.all.reverse
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
      # UserMailer.set(wait: 20.seconds).perform_later(@blog.user)
      UserMailer.delay.sample_email(@blog.user)
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
    blog.body = blog.body.gsub("\n", '</br>')
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

  def record_not_found
    redirect_to blogs_path
  end
end
