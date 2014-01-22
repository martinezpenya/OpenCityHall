class AddAdminToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :admin, :boolean
  end
end
