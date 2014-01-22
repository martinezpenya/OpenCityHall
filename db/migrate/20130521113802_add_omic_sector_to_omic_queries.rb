class AddOmicSectorToOmicQueries < ActiveRecord::Migration
  def change
    add_column :omic_queries, :omic_sector_id, :integer
  end
end
