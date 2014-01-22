class CreateOmicSituations < ActiveRecord::Migration
  def change
    create_table :omic_situations do |t|
      t.string :description

      t.timestamps
    end
  end
end
