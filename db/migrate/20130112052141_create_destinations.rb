class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :unique_id, :unique => true
      t.string :destination_type
      t.string :current_status
      t.timestamp :current_report_time
      t.integer :lat
      t.integer :long
      t.string :name
      t.text :description
      t.string :source, :default => nil

      t.timestamps
    end
    add_index :destinations, :unique_id, :unique => true
  end
end
