class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false, limit: 200
      t.text :content, null: false, limit: 1000
      t.references :user, null: false

      t.timestamps(null: false)
    end
  end
end
