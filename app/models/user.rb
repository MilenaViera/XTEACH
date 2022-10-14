# frozen_string_literal: true

class User < ApplicationRecord
  has_many :inscriptions
  has_many :courses, through: :inscriptions

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_numericality_of :grade_point_average, less_than_or_equal_to: 100
  validates_numericality_of :progress_average, less_than_or_equal_to: 100
end
