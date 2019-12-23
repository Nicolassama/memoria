class RemoveMemoIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :memo_id, :integer
  end
end
