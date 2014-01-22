class CreateOmicResults < ActiveRecord::Migration
  def change
    create_table :omic_results do |t|
      t.string :name

      t.timestamps
    end
  end
end
