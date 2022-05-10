# frozen_string_literal: true

module ApiV0
  module Entities
    class Course < Entities::Base
      expose :subject
      expose :category
      expose :status
      expose :currency
      expose :price
      expose :url
      expose :description
    end
  end
end
