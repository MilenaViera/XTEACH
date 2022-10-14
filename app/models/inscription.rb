# frozen_string_literal: true

class Inscription < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates_numericality_of :pass_score, less_than_or_equal_to: 100
  validates_numericality_of :progress, less_than_or_equal_to: 100
  validates_numericality_of :score, less_than_or_equal_to: 100
end
