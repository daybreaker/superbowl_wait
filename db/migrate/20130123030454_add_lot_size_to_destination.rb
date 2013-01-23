class AddLotSizeToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :lot_size, :string
  end
end
