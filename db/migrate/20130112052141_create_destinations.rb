class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :type
      t.string :current_wait_time
      t.timestamp :current_report_time
      t.integer :lat
      t.integer :long
      t.integer :closest_section

      t.timestamps
    end
  end
end
