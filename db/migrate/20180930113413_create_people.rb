class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthday
      t.text :biography
      t.string :place_of_birth

      t.timestamps
    end
  end
end
