# frozen_string_literal: true

class PurchasedCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course
end
