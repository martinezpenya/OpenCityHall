class AddResponseTimeToOmicSectors < ActiveRecord::Migration
  def change
    add_column :omic_sectors, :response_time, :integer
  end
end
