class AddOpenToOmicClaim < ActiveRecord::Migration
  def change
    add_column :omic_claims, :open, :boolean
  end
end
