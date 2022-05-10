# frozen_string_literal: true

module ApiV0
  module Entities
    class PurchasedCourse < Entities::Base
      expose :expiry_at
    end
  end
end
