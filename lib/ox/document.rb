
module Ox
  # Represents an XML document. It has a fixed set of attributes which form
  # the XML prolog. A Document includes Elements.
  class Document < Element
    # Create a new Document.
    # @param [Hash] prolog prolog attributes
    # @option prolog [String] :version version, typically '1.0' or '1.1'
    # @option prolog [String] :encoding encoding for the document, currently included but ignored
    # @option prolog [String] :standalone indicates the document is standalone
    def initialize(prolog={})
      super(nil)
      @attributes = { }
      @attributes[:version] = prolog[:version] unless prolog[:version].nil?
      @attributes[:encoding] = prolog[:encoding] unless prolog[:encoding].nil?
      @attributes[:standalone] = prolog[:standalone] unless prolog[:standalone].nil?
    end
    
    # Returns the first Element in the document.
    def root()
      unless @nodes.nil?
        @nodes.each do |n|
          return n if n.is_a?(::Ox::Element)
        end
      end
      nil
    end

  end # Document
end # Ox
