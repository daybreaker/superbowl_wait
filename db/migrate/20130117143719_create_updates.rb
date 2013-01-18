class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.integer :destination_unique_id
      t.string :source
      t.string :status
      t.datetime :reported_at
      t.timestamps
    end
    add_index :updates, :destination_unique_id
    add_index :updates, :source
  end
end
