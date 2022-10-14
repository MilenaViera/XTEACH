# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
    GenerateReportNotesAverageJob.perform_now()
    GenerateReportProgressAverageJob.perform_now()
    @students_completed = GenerateReportStudentsCompletedJob.perform_now()
    @students_graduated_per_inscription = GenerateReportStudentsGraduatedPerInscriptionJob.perform_now()
    @students_no_graduated_per_inscription = GenerateReportStudentsNoGraduatedPerInscription.perform_now()
    GenerateReportGraduatePlataformJob.perform_now()
  end
end
