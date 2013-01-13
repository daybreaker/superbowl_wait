class ChunkController < ApplicationController

  def show
    chunk = params[:chunk]
    chunks = chunk.split(',')
    if chunks.length == 1
      chunk = chunks[0]
    else
      #figure out which chunk to show
      # for now, just show first
      chunk = chunks[0]
    end
    @image = chunk + ".jpg"
  end

end
