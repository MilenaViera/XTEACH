# frozen_string_literal: true

class User < ApplicationRecord
  has_many :inscriptions
  has_many :courses, through: :inscriptions

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
