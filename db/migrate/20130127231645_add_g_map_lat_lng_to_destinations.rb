class AddGMapLatLngToDestinations < ActiveRecord::Migration
  def change    
    add_column :destinations, :gmap_lat_lng, :text, :default => ""
  end
end
