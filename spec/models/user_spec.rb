# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                  :bigint           not null, primary key
#  email               :string
#  grade_point_average :integer
#  name                :string
#  progress_average    :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when name is present' do
    it 'is valid' do
      should validate_presence_of(:name)
    end
  end

  context 'when email is present' do
    it 'is valid' do
      should validate_presence_of(:email)
    end
  end

  context 'when have many courses' do
    it 'is valid' do
      should have_many(:courses)
    end
  end

  context 'when have many inscriptions' do
    it 'is valid' do
      should have_many(:inscriptions)
    end
  end

  context 'when the grade point average is greater than 100' do
    it 'is not valid' do
      should validate_numericality_of(:grade_point_average).
        is_less_than_or_equal_to(100)
    end
  end

  context 'when the progress average is greater than 100' do
    it 'is not valid' do
      should validate_numericality_of(:progress_average).
        is_less_than_or_equal_to(100)
    end
  end
end
