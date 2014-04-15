module Axml
  
  class ChunkHeader
  
    attr_accessor :doc, :start, :end, :type, :header_size, :chunk_size
  
    def initialize doc
      @doc = doc
      @start = doc.file.pos
      @type, @header_size, @chunk_size = doc.file.read(8).unpack 'vvV'
      @end = @start + @chunk_size
    end
  
  end
  
end