# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :purchased_courses
  has_many :courses, through: :purchased_courses

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  validates :password_digest,
            presence: true,
            confirmation: true,
            length: { minimum: 8 }
end
