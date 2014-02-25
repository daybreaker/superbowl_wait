class CreateBathrooms < ActiveRecord::Migration
  def change
    create_table :bathrooms do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :lat
      t.string :long
      t.string :bathroom_type
      t.string :bathroom_privacy

      t.timestamps
    end
  end
end
