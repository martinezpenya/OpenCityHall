class AddComercialNameToOmicReclaimeds < ActiveRecord::Migration
  def change
    add_column :omic_reclaimeds, :comercial_name, :string
  end
end
