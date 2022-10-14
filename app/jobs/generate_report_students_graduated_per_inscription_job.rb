# frozen_string_literal: true

class GenerateReportStudentsGraduatedPerInscriptionJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Inscription.all.select do |user|
      user['graduate'] == true
    end
  end
end
