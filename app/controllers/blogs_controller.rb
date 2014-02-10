class BlogsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :new_newsletter_user, only: [:index, :show]
  authorize_resource except: [:index, :show]

  def index
    if current_user and current_user.admin?
      @blogs = Blog.all
    else
      @blogs = Blog.where(published: true)
    end
  end

  def show
    @blog = Blog.find params[:id]
    if params[:title].blank? or params[:title] != @blog.link_title
      if @blog.published?
        redirect_to blog_title_path(@blog, @blog.link_title)
      else
        blog_not_found
      end
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new blog_params
    if @blog.save
      redirect_to blog_path(@blog), flash: {notice: "Successfully created blog post."}
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
      redirect_to blog_path(@blog), flash: {notice: "Successfully updated blog."}
    else
      render "edit"
    end
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :body, :tag, :published)
    end

    def new_newsletter_user
      @newsletter_user = NewsletterUser.new
    end
end
