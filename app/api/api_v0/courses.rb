# frozen_string_literal: true

module ApiV0
  class Courses < Grape::API
    resource :courses do
      desc 'Search by category'
      params do
        requires :value, type: String, desc: 'Course category.'
      end
      get '/category' do
        courses = Course.by_category(params[:category])

        present courses, with: ApiV0::Entities::Course
      end

      desc 'Search by status'
      params do
        requires :value, type: Integer, desc: 'Course status'
      end
      get '/status' do
        courses = Course.by_status(params[:status])

        present courses, with: ApiV0::Entities::Course
      end
    end
  end
end
