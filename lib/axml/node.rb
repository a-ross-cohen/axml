module Axml
  
  class Node
    
    attr_accessor :doc, :header, :line_number, :comment
    
    def initialize doc
      @doc = doc
      @header = ChunkHeader.new doc
      @line_number, @comment = doc.file.read(8).unpack 'VV'
    end
    
  end
  
end