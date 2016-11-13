class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body, null: false, limit: 1000
      t.references :post, null: false
      t.references :user, null: false 

      t.timestamps(null: false)
    end
  end
end
