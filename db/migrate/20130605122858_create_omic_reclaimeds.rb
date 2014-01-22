class CreateOmicReclaimeds < ActiveRecord::Migration
  def change
    create_table :omic_reclaimeds do |t|
      t.string :social_name
      t.references :common_id_type
      t.string :id_doc
      t.string :address
      t.string :cp
      t.string :town
      t.string :province
      t.string :phone1
      t.string :phone2
      t.string :fax
      t.string :email
      t.text :notes

      t.timestamps
    end
    add_index :omic_reclaimeds, :common_id_type_id
  end
end
