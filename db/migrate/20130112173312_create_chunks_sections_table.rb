class CreateChunksSectionsTable < ActiveRecord::Migration
  def change
    create_table :chunks_sections, :id => false do |t|
      t.integer :chunk_id
      t.integer :section_id
    end
  end
end
