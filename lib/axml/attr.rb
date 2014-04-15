module Axml
  
  class Attr
    
    attr_accessor :ns, :name, :raw_value, :typed_value
    
    def initialize doc
      @ns, @name, @raw_value = doc.file.read(12).unpack 'VVV'
      @typed_value = TypedValue.new doc
    end
    
    def value
      val = typed_value.value
      if val == :raw
        "raw: #{raw_value.to_s 16}"
      else
        val
      end
    end
    
  end
  
end