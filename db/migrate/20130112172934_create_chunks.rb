class CreateChunks < ActiveRecord::Migration
  def change
    create_table :chunks do |t|
      t.integer :chunk_number
      t.integer :next_chunk
      t.integer :prev_chunk

      t.timestamps
    end
  end
end
