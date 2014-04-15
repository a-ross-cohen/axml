require 'logger'
require 'nokogiri'

require "axml/version"
require "axml/chunk_header"
require "axml/string_pool"
require "axml/resource_map"
require "axml/node"
require "axml/namespace"
require "axml/typed_value"
require "axml/attr"
require "axml/element"
require "axml/document"

module Axml
  
  TYPE_STRING_POOL         = 0x0001
  TYPE_XML                 = 0x0003
  TYPE_XML_FIRST_CHUNK     = 0x0100
  TYPE_XML_START_NAMESPACE = 0x0100
  TYPE_XML_END_NAMESPACE   = 0x0101
  TYPE_XML_START_ELEMENT   = 0x0102
  TYPE_XML_END_ELEMENT     = 0x0103
  TYPE_XML_CDATA           = 0x0104
  TYPE_XML_LAST_CHUNK      = 0x017f
  TYPE_XML_RESOURCE_MAP    = 0x0180
  
  LOG = Logger.new $stdout
  
  class UnexpectedData < Exception ; end
  
end
