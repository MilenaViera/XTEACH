# frozen_string_literal: true

class GenerateReportStudentsCompletedJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Inscription.all.select do |user|
      user['completed'] == true
    end
  end
end
