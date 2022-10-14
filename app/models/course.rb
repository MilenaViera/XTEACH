# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :inscriptions
  has_many :users, through: :inscriptions


  validates :title, presence: true
end
