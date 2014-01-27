class BlogsController < ApplicationController

  def index
    @blogs = Blog.limit(15)
  end

  def show
    @blog = Blog.find params[:id]
    if params[:title].blank?
      redirect_to @blog, @blog.title
    end
  end

  def new

  end

  def edit

  end

  def destroy

  end

  def update

  end
end
