class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :overall
      t.integer :cleanliness
      t.integer :comfort
      t.integer :tp
      t.integer :location
      t.references :bathroom

      t.timestamps
    end
    add_index :ratings, :bathroom_id
  end
end
