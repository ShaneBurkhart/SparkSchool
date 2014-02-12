class BlogsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :new_newsletter_user, only: [:index, :show]
  authorize_resource except: [:index, :show]

  def index
    if current_user and current_user.admin?
      @blogs = Blog.order(created_at: :desc)
    else
      @blogs = Blog.where(published: true).order(created_at: :desc)
    end
  end

  def show
    @blog = Blog.find params[:id]
    if (!current_user or !current_user.admin?) and !@blog.published?
      blog_not_found
    end
    if params[:title].blank? or params[:title] != @blog.link_title
      redirect_to blog_title_path(@blog, @blog.link_title)
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

  def hack_and_tell
    AdminMailer.hack_and_tell_email(params[:email], params[:message]).deliver
    redirect_to blogs_path, flash: {notice: 'Thanks for letting us know!'}
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :body, :tag, :published)
    end

    def new_newsletter_user
      @newsletter_user = NewsletterUser.new
    end
end
