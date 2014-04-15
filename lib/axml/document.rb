module Axml
  
  class Document
    
    attr_accessor :file, :header, :string_pool, :resource_map, :ns_start, :root
    
    def initialize file
      @file = file
      @header = ChunkHeader.new self
      if @header.type != Axml::TYPE_XML
        raise UnexpectedData.new "This does not appear to be an Axml document #{@header.type.to_s 16}"
      end
      @string_pool = StringPool.new self
      @resource_map = ResourceMap.new self
      @ns_start = Namespace.new self
      @root = Axml::Element.new self
    end
    
    def strings
      @string_pool.strings
    end
    
    def to_xml
      @xml ||= Nokogiri::XML::Builder.new { |xml| @root.generate_tag xml }.to_xml
    end
    
    def inspect bool = false
      super if bool
      ""
    end
    
  end
  
end