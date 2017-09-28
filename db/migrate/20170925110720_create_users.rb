class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :email
      t.string :password
      t.string :imageUrl
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
