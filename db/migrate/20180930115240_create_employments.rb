# frozen_string_literal: true

class CreateEmployments < ActiveRecord::Migration[5.2]
  def change
    create_table :employments do |t|
      t.string :job_details
      t.references :film, foreign_key: true
      t.references :person, foreign_key: true
      t.timestamps
    end
  end
end
