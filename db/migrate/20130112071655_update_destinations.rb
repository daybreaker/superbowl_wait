class UpdateDestinations < ActiveRecord::Migration

  def change
    add_column :destinations, :name, :string
    add_column :destinations, :description, :text
  end

end
