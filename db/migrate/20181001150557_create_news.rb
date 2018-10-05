# frozen_string_literal: true

class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :heading
      t.text :body
      t.references :user, foreign_key: true
      t.references :film, foreign_key: true

      t.timestamps
    end
  end
end
