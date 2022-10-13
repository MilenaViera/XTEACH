# frozen_string_literal: true

class CreateInscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :inscriptions do |t|
      t.belongs_to :user
      t.belongs_to :course
      t.integer :pass_score
      t.integer :progress
      t.integer :score
      t.boolean :completed
      t.boolean :graduate
      t.datetime :inscription_date
      t.timestamps
    end
  end
end
