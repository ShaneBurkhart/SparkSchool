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
    @blog = Blog.new
  end

  def create
    @blog = Blog.new blog_params
    if @blog.save
      redirect_to blogs_path, flash: {notice: "Successfully created blog post."}
    else
      render "new"
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, flash: {notice: "Successfully deleted blog post."}
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.attributes = blog_params
    if @blog.save
      redirect_to blogs_path, flash: {notice: "Successfully updated blog."}
    else
      render "edit"
    end
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :body, :tag)
    end
end
