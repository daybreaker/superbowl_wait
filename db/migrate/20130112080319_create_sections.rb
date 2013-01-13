class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :section_number
      t.integer :x
      t.integer :y

      t.timestamps
    end
    add_index :sections, :section_number,   :unique => true
  end
end
