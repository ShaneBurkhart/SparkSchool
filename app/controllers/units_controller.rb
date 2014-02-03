class UnitsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  authorize_resource except: [:index, :show]

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new unit_params
    if @unit.save
      redirect_to courses_tag_path(@unit.course.tag), flash: {notice: "Successfully created unit."}
    else
      flash[:error] = "Something went wrong."
      render "new"
    end
  end

  def edit
    @unit = Unit.find params[:id]
  end

  def update
    @unit = Unit.find params[:id]
    @unit.attributes = unit_params
    if @unit.save
      redirect_to courses_tag_path(@unit.course.tag), flash: {notice: "Successfully updated unit."}
    else
      flash[:error] = "Something went wrong."
      render "edit"
    end
  end

  def destroy
    @unit = Unit.find params[:id]
    @course_tag = @unit.course.tag
    @unit.destroy
    redirect_to course_tag_path(@course_tag), flash: {notice: "Successfully deleted unit."}
  end

  private

    def unit_params
      params.require(:unit).permit(:name, :course_id, :unit_number)
    end

end
