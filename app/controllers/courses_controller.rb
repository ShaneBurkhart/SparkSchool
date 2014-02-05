class CoursesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  authorize_resource except: [:index, :show]

  def index
    if can? :manage, Course
      @courses = Course.all
    else
      @courses = Course.where(published: true).all
    end
  end

  def show
    @course = Course.find_by(tag: params[:tag])
    @counter = 1
    not_found if @course.nil? || (!@course.published? && cannot?(:manage, Course))
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      redirect_to courses_path, flash: {notice: "Successfully created course!"}
    else
      flash[:error] = "Something went wrong!"
      render "new"
    end
  end

  def edit
    @course = Course.find params[:id]
  end

  def update
    @course = Course.find params[:id]
    @course.attributes = course_params
    if @course.save
      redirect_to course_tag_path(@course.tag), flash: {notice: "Successfully updated course."}
    else
      flash[:error] = "Something went wrong."
      render "edit"
    end
  end

  def destroy
    @course = Course.find params[:id]
    @course.destroy
    redirect_to courses_path, flash: {notice: "Successfully destroyed course."}
  end

  private

    def course_params
      params.require(:course).permit(:name, :description, :tag)
    end

end
