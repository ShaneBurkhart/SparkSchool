class LessonsController < ApplicationController
  before_filter :authenticate_user!, except: [:rate_redirect, :rate, :index, :show]
  before_filter :lessons_in_order, except: [:rate_redirect, :rate, :index, :show]
  before_filter :parameter_objects, except: [:rate_redirect, :rate, :index, :show]
  authorize_resource except: [:index, :show, :rate_redirect, :rate]
  before_filter :update_user_progress, only: [:show]

  def show
    @course_tag = params[:tag]
    @lesson_number = lesson_number
    @course = Course.find_by(tag: params[:tag])
    not_found if @course.nil? #if course doesn't exist then raise route error
    @lessons = @course.ordered_lessons #lessons ordered by unit then lesson number
    not_found if @lessons.length < @lesson_number || @lesson_number < 1 #check if in range
    @lesson = @lessons[@lesson_number - 1]
    @lesson_rating = LessonRating.find_by(lesson_id: @lesson.id, user_id: current_user.id) if current_user
    @counter = 1
  end

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

  def rate
    if(!current_user)
      render json: {status: "You are not logged in."}, status: 500
      return
    end
    @lesson_rating = LessonRating.find_or_create_by_user_id_and_lesson_id(current_user.id, params[:lesson_id])
    @lesson_rating.liked = params[:liked]
    if @lesson_rating.save
      render json: @lesson_rating, status: 200
    else
       render json: @lesson_rating, status: 500
    end
  end

  def rate_redirect
    session[:return_to] = request.referer
    redirect_to new_user_session_path
  end

  private

    def update_user_progress
      if current_user
        @lessons = @course.ordered_lessons #lessons ordered by unit then lesson number
        @lesson = @lessons[@lesson_number - 1]
        CompletedLesson.find_or_create_by_user_id_and_lesson_id(current_user.id, @lesson.id)
      end
    end

    def lesson_params
      params.require(:lesson).permit(:name, :unit_id, :description, :lesson_number, :body)
    end

    def lessons_in_order
      @lessons = Lesson.where(unit_id: params[:unit_id]).order(lesson_number: :asc)
    end

    def parameter_objects
      @course = Course.find(params[:course_id])
      @unit = Unit.find(params[:unit_id])
    end

    def lesson_number
      params[:lesson_number].to_i
    end

end
