class CreateJoinTablePermissionRole < ActiveRecord::Migration[5.1]
  def change
    create_join_table :permissions, :roles do |t|
      t.index [:permission_id, :role_id]
    end
  end
end
