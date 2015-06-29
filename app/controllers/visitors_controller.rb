class VisitorsController < ApplicationController

  def index
    @first_blog, @second_blog, @third_blog = Blog.last(3)
    @blog_arr = [@first_blog, @second_blog, @third_blog]
  end
end
