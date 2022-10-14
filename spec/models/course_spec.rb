# frozen_string_literal: true

# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'when title is present' do
    it 'is valid' do
      should validate_presence_of(:title)
    end
  end

  context 'when have many users' do
    it 'is valid' do
      should have_many(:users)
    end
  end

  context 'when have many inscriptions' do
    it 'is valid' do
      should have_many(:inscriptions)
    end
  end
end
