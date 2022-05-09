# frozen_string_literal: true

module ApiV0
  class Base < Grape::API
    version 'v0', using: :path

    mount Test
    mount PurchasedCourses
  end
end
