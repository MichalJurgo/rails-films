class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :title
      t.text :description
      t.text :short_description
      t.integer :duration
      t.date :release
      t.text :production

      t.timestamps
    end
  end
end
