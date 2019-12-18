class AddColumnRelationships < ActiveRecord::Migration[5.2]
  def change
  	add_column :relationships, :following_id, :integer
  	add_column :users, :user_image_id, :string

  end
end
