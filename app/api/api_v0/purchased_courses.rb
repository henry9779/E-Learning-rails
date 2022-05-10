# frozen_string_literal: true

module ApiV0
  class PurchasedCourses < Grape::API
    before { authenticate! }

    helpers do
      def current_user
        User.find_by(id: params[:user_id])
      end

      def authenticate!
        error!('401 Unauthorized', 401) unless current_user
      end
    end

    resource :purchased_courses do
      desc 'Return current user purchased courses.'
      params do
        requires :user_id, type: Integer, desc: 'User ID.'
      end
      get do
        course_ids = current_user.purchased_courses.map(&:course_id)
        courses = Course.detail(course_ids)

        present courses, with: ApiV0::Entities::Course
      end

      desc 'Create purchase history.'
      params do
        requires :user_id, type: Integer, desc: 'User ID.'
        requires :course_id, type: Integer, desc: 'Course ID.'
      end
      post do
        if Course.exists?(id: params[:course_id])
          course = Course.find_by(id: params[:course_id])
          user_course = PurchasedCourse.find_by(user_id: params[:user_id], course_id: params[:course_id])
          if course.status_published?
            if user_course.try(:expiry_at).nil? || DateTime.now > user_course.try(:expiry_at)
              PurchasedCourse.create(user_id: params[:user_id],
                                     course_id: params[:course_id],
                                     expiry_at: DateTime.now + course.valid_day)
            else
              error!('404 This course is available and has not expired', 404)
            end
          else
            error!('404 This course has been taken down', 404)
          end
        else
          error!('404 No course record', 404)
        end
      end
    end
  end
end
