class AddRolesToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :roles, :string
  end
end
