# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :init_course, only: :index
  before_action :set_my_course, only: :my_courses

  def index; end

  def my_courses; end

  def init_course
    @courses = Course.status_published
  end

  def set_my_course
    user_course = Current.user.purchased_courses
    course_ids = user_course.map(&:course_id)
    @courses = Course.where(id: course_ids)
  end
end
