class AddOpenToOmicQueries < ActiveRecord::Migration
  def change
    add_column :omic_queries, :open, :boolean
  end
end
