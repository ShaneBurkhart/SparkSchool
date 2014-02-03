class LessonsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  authorize_resource except: [:index, :show]

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new lesson_params
    if @lesson.save
      redirect_to course_tag_path(@lesson.unit.course.tag), flash: {notice: "Successfully created lesson."}
    else
      flash[:error] = "Something went wrong."
      render "new"
    end
  end

  def edit
    @lesson = Lesson.find params[:id]
  end

  def update
    @lesson = Lesson.find params[:id]
    @lesson.attributes = lesson_params
    if @lesson.save
      redirect_to course_tag_path(@lesson.unit.course.tag), flash: {notice: "Successfully updated lesson."}
    else
      flash[:error] = "Something went wrong."
      render "edit"
    end
  end

  def destroy
    @lesson = Lesson.find params[:id]
    @course_tag = @lesson.unit.course.tag
    @lesson.destroy
    redirect_to course_tag_path(@course_tag), flash: {notice: "Successfully deleted lesson."}
  end

  private

    def lesson_params
      params.require(:lesson).permit(:name, :unit_id, :description, :lesson_number)
    end


end
