class CreateCommonIdTypes < ActiveRecord::Migration
  def change
    create_table :common_id_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
