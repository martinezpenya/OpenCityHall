class AddOmicMeanIdToOmicQueries < ActiveRecord::Migration
  def change
    add_column :omic_queries, :omic_mean_id, :integer
  end
end
