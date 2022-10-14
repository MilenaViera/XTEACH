# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GenerateReportStudentsCompletedJob, type: :job do
  context 'when specify that job was enqueued' do
    it 'is in queue' do
      ActiveJob::Base.queue_adapter = :test
      expect {
        GenerateReportStudentsCompletedJob.perform_later()
      }.to have_enqueued_job
    end
  end
end
