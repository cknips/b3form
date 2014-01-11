module B3Form
  class Helper
    attr_reader :builder, :field, :options

    def initialize(builder, field, options)
      @builder = builder
      @field   = field
      @options = options
    end

    delegate :object, :content_tag, to: :builder
  end
end
