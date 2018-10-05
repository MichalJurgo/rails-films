# frozen_string_literal: true

class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.references :user, foreign_key: true
      t.references :film, foreign_key: true
      t.integer :status_id

      t.timestamps
    end
  end
end
