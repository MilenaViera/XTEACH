# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :progress_average
      t.integer :grade_point_average
      t.boolean :graduate
      t.timestamps
    end
  end
end
