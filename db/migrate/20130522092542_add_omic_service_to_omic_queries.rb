class AddOmicServiceToOmicQueries < ActiveRecord::Migration
  def change
    add_column :omic_queries, :omic_service_id, :integer
  end
end
