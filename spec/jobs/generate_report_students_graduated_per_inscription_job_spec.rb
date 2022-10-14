# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GenerateReportStudentsGraduatedPerInscriptionJob, type: :job do
  context 'when specify that job was enqueued' do
    it 'is in queue' do
      ActiveJob::Base.queue_adapter = :test
      expect {
        GenerateReportStudentsGraduatedPerInscriptionJob.perform_later()
      }.to have_enqueued_job
    end
  end
end
