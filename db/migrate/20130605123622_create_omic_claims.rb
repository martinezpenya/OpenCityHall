class CreateOmicClaims < ActiveRecord::Migration
  def change
    create_table :omic_claims do |t|
      t.integer :year
      t.datetime :datetime
      t.text :facts
      t.text :documents
      t.text :pretensions
      t.text :notes
      t.references :omic_petitioner
      t.references :omic_reclaimed
      t.references :omic_result
      t.references :admin_user
      t.references :omic_sector
      t.references :omic_reason
      t.references :omic_mean
      t.timestamps
    end
    add_index :omic_claims, :omic_petitioner_id
    add_index :omic_claims, :omic_reclaimed_id
    add_index :omic_claims, :omic_result_id
    add_index :omic_claims, :admin_user_id
    add_index :omic_claims, :omic_sector_id
    add_index :omic_claims, :omic_reason_id
    add_index :omic_claims, :omic_mean_id
  end
end
