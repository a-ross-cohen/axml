module Axml
  
  class Namespace < Node
    
    attr_accessor :header, :line_number, :comment, :prefix, :uri
    
    def initialize doc
      super doc
      if @header.type != Axml::TYPE_XML_START_NAMESPACE
        raise UnexpectedData.new "Namespace not present, aborting #{format '%x', @header.type}"
      end
      @prefix, @uri = doc.file.read(8).unpack 'VV'
    end
    
  end
  
end