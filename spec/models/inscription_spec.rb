# frozen_string_literal: true

# == Schema Information
#
# Table name: inscriptions
#
#  id         :bigint           not null, primary key
#  completed  :boolean
#  graduate   :boolean
#  pass_score :integer
#  progress   :integer
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_inscriptions_on_course_id  (course_id)
#  index_inscriptions_on_user_id    (user_id)
#
require 'rails_helper'

RSpec.describe Inscription, type: :model do
  context 'should be associated with a user' do
    it 'it valid' do
      should belong_to(:user).without_validating_presence
    end
  end

  context 'should be associated with a course' do
    it 'it valid' do
      should belong_to(:course).without_validating_presence
    end
  end

  context 'when the pass_score is greater than 100' do
    it 'it not valid' do
      should validate_numericality_of(:pass_score).
        is_less_than_or_equal_to(100)
    end
  end

  context 'when the progress is greater than 100' do
    it 'it not valid' do
      should validate_numericality_of(:progress).
        is_less_than_or_equal_to(100)
    end
  end

  context 'when the score is greater than 100' do
    it 'it not valid' do
      should validate_numericality_of(:score).
        is_less_than_or_equal_to(100)
    end
  end
end
