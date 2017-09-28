class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
