# frozen_string_literal: true

class GenerateReportNotesAverageJob < ApplicationJob
  queue_as :default

  def perform(*args)
    User.all.each do |user|
      average = get_average_notes_student(user.id) / Inscription.where(user_id: user).count
      user.update grade_point_average: average
    end
  end

  def get_average_notes_student(user)
    Inscription.where(user_id: user).sum(:score)
  end
end
