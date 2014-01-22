class CreateOmicMeans < ActiveRecord::Migration
  def change
    create_table :omic_means do |t|
      t.string :description

      t.timestamps
    end
  end
end
