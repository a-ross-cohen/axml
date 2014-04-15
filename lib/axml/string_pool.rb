module Axml
  
  class StringPool
    
    attr_accessor :doc, :header, :string_count, :style_count, :flags, :string_start, :style_start, :strings
    
    def initialize doc
      @doc = doc
      @header = ChunkHeader.new doc
      if @header.type != Axml::TYPE_STRING_POOL
        raise UnexpectedData.new "String pool not present, aborting #{format '%x', @header.type}"
      end
      @string_count, @style_count, @flags, @string_start, @style_start = doc.file.read(20).unpack 'VVVVV'
      @addrs = []
      @string_count.times { @addrs << doc.file.read(4).unpack('V') }
      @strings = []
      @addrs.each do |addr|
        length = doc.file.read(2).unpack('v').first
        @strings << doc.file.read(length * 2).tr_s(0.chr, '')
        doc.file.read 2
      end
    end
    
  end
  
end