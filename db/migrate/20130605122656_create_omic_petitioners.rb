class CreateOmicPetitioners < ActiveRecord::Migration
  def change
    create_table :omic_petitioners do |t|
      t.string :firstname
      t.string :surname1
      t.string :surname2
      t.references :common_id_type
      t.string :id_doc
      t.string :address
      t.string :cp
      t.string :town
      t.string :province
      t.string :phone1
      t.string :phone2
      t.string :email
      t.text :notes
      t.references :omic_age
      t.boolean :sex
      t.timestamps
    end
    add_index :omic_petitioners, :common_id_type_id
    add_index :omic_petitioners, :omic_age_id
  end
end
