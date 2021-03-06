class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.date   :birth_date
      t.string :country
      t.string :locality

      t.timestamps
    end
  end
end
