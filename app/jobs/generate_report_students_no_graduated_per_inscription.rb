# frozen_string_literal: true

class GenerateReportStudentsNoGraduatedPerInscription < ApplicationJob
  queue_as :default

  def perform(*args)
    Inscription.all.select do |user|
      user['graduate'] == false
    end
  end
end
