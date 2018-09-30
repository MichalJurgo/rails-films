class RemoveJobIdFromEmployments < ActiveRecord::Migration[5.2]
  def change
    remove_index :employments, :job_id
    remove_column :employments, :job_id

  end
end
