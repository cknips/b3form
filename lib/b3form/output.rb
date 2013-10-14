module B3Form
  class Output
    attr_reader :builder, :field, :options

    def initialize(builder, field, options)
      @builder = builder
      @field   = field
      @options = options
    end

    delegate :object, to: :builder
  end
end
