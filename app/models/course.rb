# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :purchased_courses
  has_many :users, through: :purchased_courses

  enum status: { unpublished: 0, published: 1 }, _prefix: true
  enum currency: { twd: 0, cny: 1, jpy: 2, hkd: 3, usd: 4 }, _prefix: true
  enum category: { chinese: 0, english: 1, math: 2, physics: 3, history: 4 }, _prefix: true

  validates :subject, presence: true, uniqueness: true

  validates :currency, :category, :status, :description, presence: true

  validates :price,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }

  validates :valid_day,
            presence: true,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 1,
                            less_than_or_equal_to: 31 }

  scope :detail, ->(ids) { where(id: ids) }
  scope :by_category, ->(value) { where(category: value) }
  scope :by_status, ->(value) { where(status: value) }
end
