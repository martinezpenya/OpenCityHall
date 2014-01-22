class CreateOmicAges < ActiveRecord::Migration
  def change
    create_table :omic_ages do |t|
      t.string :description

      t.timestamps
    end
  end
end
