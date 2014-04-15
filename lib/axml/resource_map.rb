module Axml
  
  class ResourceMap
    
    attr_accessor :doc, :header, :resources
    
    def initialize doc
      @doc = doc
      @header = ChunkHeader.new doc
      if @header.type != Axml::TYPE_XML_RESOURCE_MAP
        raise UnexpectedData.new "Resource map not present, aborting #{format '%x', @header.type}"
      end
      @resources = []
      while doc.file.pos < @header.end
        @resources << doc.file.read(4).unpack('V').first
      end
    end
    
  end
  
end