class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :username, unique: true
      t.string :email, unique: true
      t.string :password_digest
      t.string :imageUrl
      t.boolean :is_active, default: true
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
