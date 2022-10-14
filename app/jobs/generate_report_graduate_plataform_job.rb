# frozen_string_literal: true

class GenerateReportGraduatePlataformJob < ApplicationJob
  queue_as :default

  def perform(*args)
    User.all.each do |user|
      graduated = obtener_cantidad_de_inscripciones(user) == obtener_cantidad_de_inscripciones_graduado(user)
      user.update graduate: graduated
    end
  end

  def obtener_cantidad_de_inscripciones(user)
    Inscription.where(user_id: user).count
  end

  def obtener_cantidad_de_inscripciones_graduado(user)
    Inscription.where(user_id: user).count do |user|
      user['graduate'] == true
    end
  end
end
