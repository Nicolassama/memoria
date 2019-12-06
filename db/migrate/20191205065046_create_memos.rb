class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :memo_image_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
