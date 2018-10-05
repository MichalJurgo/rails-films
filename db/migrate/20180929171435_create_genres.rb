# frozen_string_literal: true

class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.timestamps
    end

    create_table :films_genres, id: false do |t|
      t.belongs_to :film, index: true
      t.belongs_to :genre, index: true
    end
  end
end
