class AddJobToEmployments < ActiveRecord::Migration[5.2]
  def change
    add_column :employments, :job, :string
  end
end
