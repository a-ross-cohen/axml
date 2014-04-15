module Axml
  
  class TypedValue
    
    # Contains no data.
    TYPE_NULL = 0x00,
    # The 'data' holds a ResTable_ref, a reference to another resource table entry.
    TYPE_REFERENCE = 0x01,
    # The 'data' holds an attribute resource identifier.
    TYPE_ATTRIBUTE = 0x02,
    # The 'data' holds an index into the containing resource table's global value string pool.
    TYPE_STRING = 0x03,
    # The 'data' holds a single-precision floating point number.
    TYPE_FLOAT = 0x04,
    # The 'data' holds a complex number encoding a dimension value, such as "100in".
    TYPE_DIMENSION = 0x05,
    # The 'data' holds a complex number encoding a fraction of a container.
    TYPE_FRACTION = 0x06,
    # Beginning of integer flavors...
    TYPE_FIRST_INT = 0x10,
    # The 'data' is a raw integer value of the form n..n.
    TYPE_INT_DEC = 0x10,
    # The 'data' is a raw integer value of the form 0xn..n.
    TYPE_INT_HEX = 0x11,
    # The 'data' is either 0 or 1, for input "false" or "true" respectively.
    TYPE_INT_BOOLEAN = 0x12,
    # Beginning of color integer flavors...
    TYPE_FIRST_COLOR_INT = 0x1c,
    # The 'data' is a raw integer value of the form #aarrggbb.
    TYPE_INT_COLOR_ARGB8 = 0x1c,
    # The 'data' is a raw integer value of the form #rrggbb.
    TYPE_INT_COLOR_RGB8 = 0x1d,
    # The 'data' is a raw integer value of the form #argb.
    TYPE_INT_COLOR_ARGB4 = 0x1e,
    # The 'data' is a raw integer value of the form #rgb.
    TYPE_INT_COLOR_RGB4 = 0x1f,
    # ...end of integer flavors.
    TYPE_LAST_COLOR_INT = 0x1f,
    # ...end of integer flavors.
    TYPE_LAST_INT = 0x1f
    
    attr_accessor :doc, :size, :zero, :data_type, :data
    
    def initialize doc
      @doc = doc
      @size, @zero, @data_type, @data = doc.file.read(8).unpack 'vccV'
    end
    
    def value
      case data_type
      when TYPE_NULL
        nil
      when TYPE_REFERENCE
        "@TYPE_REFERENCE"
      when TYPE_ATTRIBUTE
        "@TYPE_ATTRIBUTE"
      when TYPE_STRING
        doc.strings[data]
      when TYPE_FLOAT
        "@TYPE_FLOAT"
      when TYPE_DIMENSION
        "@TYPE_DIMENSION"
      when TYPE_FRACTION
        "@TYPE_FRACTION"
      when TYPE_FIRST_INT
        data
      when TYPE_INT_DEC
        "@TYPE_INT_DEC"
      when TYPE_INT_HEX
        "@TYPE_INT_HEX"
      when TYPE_INT_BOOLEAN
        "@TYPE_INT_BOOLEAN => #{data.to_s 16}"
      when TYPE_FIRST_COLOR_INT
        "@TYPE_FIRST_COLOR_INT"
      when TYPE_INT_COLOR_ARGB8
        "@TYPE_INT_COLOR_ARGB8"
      when TYPE_INT_COLOR_RGB8
        "@TYPE_INT_COLOR_RGB8"
      when TYPE_INT_COLOR_ARGB4
        "@TYPE_INT_COLOR_ARGB4"
      when TYPE_INT_COLOR_RGB4
        "@TYPE_INT_COLOR_RGB4"
      when TYPE_LAST_COLOR_INT
        "@TYPE_LAST_COLOR_INT"
      when TYPE_LAST_INT
        "@TYPE_LAST_INT"
      end
    end
    
  end
  
end