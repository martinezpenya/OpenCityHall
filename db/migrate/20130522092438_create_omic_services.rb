class CreateOmicServices < ActiveRecord::Migration
  def change
    create_table :omic_services do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
