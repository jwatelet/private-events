class AddUniqueIndexToEnrollments < ActiveRecord::Migration[7.1]
  def change
    add_index :enrollments, [:user_id, :event_id], unique: true
  end
end
