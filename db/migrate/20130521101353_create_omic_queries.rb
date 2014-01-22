class CreateOmicQueries < ActiveRecord::Migration
  def change
    create_table :omic_queries do |t|
      t.datetime :date
      t.text :notes

      t.timestamps
    end
  end
end
