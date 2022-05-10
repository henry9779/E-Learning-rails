# frozen_string_literal: true

module ApiV0
  class Courses < Grape::API
    before { authenticate! }

    helpers do
      def current_user
        User.find_by(id: params[:user_id])
      end

      def authenticate!
        error!('401 Unauthorized', 401) unless current_user
      end
    end

    resource :courses do
      desc 'Search by category'
      params do
        requires :user_id, type: Integer, desc: 'User ID.'
        requires :value, type: String, desc: 'Course category.'
      end
      get '/category' do
        authenticate!
        user_courses = current_user.purchased_courses
        course_ids = user_courses.map(&:course_id)
        cousrses = Course.detail(course_ids)
        courses_by_category = cousrses.by_category(params[:value])

        present courses_by_category, with: ApiV0::Entities::Course
      end

      desc 'Search by status'
      params do
        requires :user_id, type: Integer, desc: 'User ID.'
      end
      get '/available' do
        authenticate!
        user_courses = current_user.purchased_courses.select { |course| course.expiry_at > DateTime.now }
        course_ids = user_courses.map(&:course_id)
        available_courses = Course.detail(course_ids)

        present available_courses, with: ApiV0::Entities::Course
      end
    end
  end
end
