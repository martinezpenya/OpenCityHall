class AddOmicReasonIdToOmicQueries < ActiveRecord::Migration
  def change
    add_column :omic_queries, :omic_reason_id, :integer
  end
end
