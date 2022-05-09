# frozen_string_literal: true

module ApiV0
  class PurchasedCourses < Grape::API
    resource :purchased_courses do
      desc 'Create purchase history'
      params do
        requires :user_id, type: Integer
        requires :course_id, type: Integer
      end
      post do
        if User.exists?(id: params[:user_id])
          if Course.exists?(id: params[:course_id])
            course = Course.find_by(id: params[:course_id])
            user_course = PurchasedCourse.find_by(user_id: params[:user_id], course_id: params[:course_id])
            if course.status_published?
              if user_course.try(:expiry_at).nil? || DateTime.now > user_course.try(:expiry_at)
                PurchasedCourse.create(user_id: params[:user_id],
                                       course_id: params[:course_id],
                                       expiry_at: DateTime.now + course.valid_day)
              else
                { error: 'This course is available and has not expired' }
              end
            else
              { error: 'This course has been taken down' }
            end
          else
            { error: 'No course record' }
          end
        else
          { error: 'No user record' }
        end
      end
    end
  end
end
