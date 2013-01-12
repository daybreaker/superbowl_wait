class AddChunkToSection < ActiveRecord::Migration
  def change
    add_column :sections, :chunk, :string
  end
end
