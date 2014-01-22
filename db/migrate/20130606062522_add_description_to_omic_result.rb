class AddDescriptionToOmicResult < ActiveRecord::Migration
  def change
    add_column :omic_results, :description, :string
  end
end