class AddSourceToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :source, :string, :default => nil
  end
end
