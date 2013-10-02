class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true
      t.integer :author_id
      t.text :content

      t.timestamps
    end
  end
end
