class CreateOmicQueries < ActiveRecord::Migration
  def change
    create_table :omic_queries do |t|
      t.datetime :datetime
      t.text :notes

      t.timestamps
    end
  end
end
