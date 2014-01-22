class AddAdminUserToOmicQueries < ActiveRecord::Migration
  def change
    add_column :omic_queries, :admin_user_id, :integer
  end
end
