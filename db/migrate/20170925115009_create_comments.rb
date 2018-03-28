class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :message
      t.references :user, foreign_key: true
      t.references :blog, foreign_key: true
      t.boolean :flagged
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
