# frozen_string_literal: true

module ApiV0
  module Entities
    class PurchasedCourse < Entities::Base
      expose :expiry_at, format_with: :iso8601
    end
  end
end
