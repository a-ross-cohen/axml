module Axml
  
  class Element < Node
    
    attr_accessor :ns, :name, :start, :size, :count, :id, :class, :style, :attrs, :children, :end_element
    
    def initialize doc
      super doc
      unless start_element? or end_element?
        raise UnexpectedData.new "Element not present, aborting #{format '%x', @header.type}"
      end
      parse_name
      if start_element?
        parse_metadata
        parse_attrs
        parse_children
        consume_end_element
      end
    end
    
    def generate_tag xml
      xml.send(doc.strings[@name], attrs_hash) {
        @children.each { |child| child.generate_tag xml }
      }
    end
    
    def parse_name
      @ns, @name = doc.file.read(8).unpack 'VV'
    end
    
    def parse_metadata
      @start, @size, @count, @id, @class, @style = doc.file.read(12).unpack 'vvvvvv'
    end
    
    def attrs_hash
      @attrs.each_with_object({}) { |attr, hash| hash[doc.strings[attr.name]] = attr.value }
    end
    
    def parse_attrs
      @attrs = []
      @count.times do
        @attrs << Attr.new(doc)
      end
    end
    
    def parse_children
      @children = []
      while has_more_children?
        @children << Element.new(doc)
      end
    end
    
    def has_more_children?
      bytes = look_ahead(2).unpack('v').first
      bytes != Axml::TYPE_XML_END_ELEMENT
    end
    
    def consume_end_element
      @end_element = Element.new doc
    end
    
    def look_ahead bytes
      data = doc.file.read bytes
      doc.file.seek -bytes, IO::SEEK_CUR
      data
    end
    
    def start_element?
      @header.type == Axml::TYPE_XML_START_ELEMENT
    end
    
    def end_element?
      @header.type == Axml::TYPE_XML_END_ELEMENT
    end
    
  end
  
end