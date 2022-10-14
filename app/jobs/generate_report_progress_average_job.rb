# frozen_string_literal: true

class GenerateReportProgressAverageJob < ApplicationJob
  queue_as :default

  def perform(*args)
    User.all.each do |user|
      average = get_average_progress_student(user.id) / Inscription.where(user_id: user).count
      user.update progress_average: average
    end
  end

  def get_average_progress_student(user)
    Inscription.where(user_id: user).sum(:progress)
  end
end
