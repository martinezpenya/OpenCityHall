class CreateAccessVisits < ActiveRecord::Migration
  def change
    create_table :access_visits do |t|
      t.integer :year
      t.date :datetime
      t.references :admin_user
      t.references :common_id_type
      t.string :id_doc
      t.string :name
      t.string :motivation
      t.time :enter_datetime
      t.time :exit_datetime
      t.timestamps
    end
  end
end
