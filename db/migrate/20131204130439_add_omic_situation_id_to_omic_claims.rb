class AddOmicSituationIdToOmicClaims < ActiveRecord::Migration
  def change
    add_column :omic_claims, :omic_situation_id, :integer
  end
end
