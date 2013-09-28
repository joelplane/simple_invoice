module SimpleInvoice
  class Config
    class << self

      extend Forwardable
      def_delegator :instance, :[]

      def instance
        @instance ||= new
      end

      # @param callable [#call] object that responds to call(),
      #                         which returns the next invoice number.
      def allocate_invoice_number callable
        instance[:allocate_invoice_number] = callable
      end

    end

    def initialize
      @config_hash = {}
    end

    def [](key)
      @config_hash[key]
    end

    def []=(key, value)
      @config_hash[key] = value
    end

  end
end
