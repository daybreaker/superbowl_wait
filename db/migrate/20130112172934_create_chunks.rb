class CreateChunks < ActiveRecord::Migration
  def change
    create_table :chunks do |t|
      t.integer :chunk_number
      t.integer :next_chunk
      t.integer :prev_chunk

      t.timestamps
    end
    add_index :chunks, :chunk_number,   :unique => true
  end
end
