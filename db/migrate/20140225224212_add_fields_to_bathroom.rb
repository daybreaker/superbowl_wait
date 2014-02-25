class AddFieldsToBathroom < ActiveRecord::Migration
  def change
    add_column :bathrooms, :tp_quality, :string
    add_column :bathrooms, :cost, :string
    add_column :bathrooms, :notes, :text
  end
end
