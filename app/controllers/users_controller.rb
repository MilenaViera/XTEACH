class UsersController < ApplicationController
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
