class AddAccessListToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :authorized_phones, :text, :default => ""
  end
end
