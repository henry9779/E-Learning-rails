# frozen_string_literal: true

class Admin::CoursesController < Admin::BaseController
  before_action :find_course, only: %i[show edit update destroy]

  def index
    @courses = Course.all
  end

  def show; end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to admin_root_path, notice: t('.success')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @course.update(course_params)
      redirect_to admin_root_path, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    if @course.destroy
      redirect_to admin_root_path, notice: t('.success')
    else
      flash[:alert] = t('.fail')
      render :index
    end
  end

  private

  def course_params
    params.require(:course).permit(:subject,
                                   :price,
                                   :currency,
                                   :category,
                                   :status,
                                   :url,
                                   :description,
                                   :valid_day)
  end

  def find_course
    @course = Course.find_by(id: params[:id])
  end
end
