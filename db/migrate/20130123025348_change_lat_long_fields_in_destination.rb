class ChangeLatLongFieldsInDestination < ActiveRecord::Migration
  def up
    change_column :destinations, :lat, :string
    change_column :destinations, :long, :string
  end

  def down
    change_column :destinations, :lat, :integer
    change_column :destinations, :long, :integer
  end
end
