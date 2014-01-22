class CreateOmicSectors < ActiveRecord::Migration
  def change
    create_table :omic_sectors do |t|
      t.string :description
      t.timestamps
    end
  end
end
