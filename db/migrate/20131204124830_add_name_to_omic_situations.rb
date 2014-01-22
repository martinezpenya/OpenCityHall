class AddNameToOmicSituations < ActiveRecord::Migration
  def change
    add_column :omic_situations, :name, :string
  end
end
