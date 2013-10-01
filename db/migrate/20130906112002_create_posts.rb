class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true
      t.integer :author_id
      t.string :post

      t.timestamps
    end
  end
end
