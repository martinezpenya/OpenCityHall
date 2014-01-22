class AddInitialsToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :initials, :string
  end
end
