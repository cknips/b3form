module B3Form
  class FormBuilder < ActionView::Helpers::FormBuilder
    attr_reader :renderer_objects
    def initialize(*)
      super
      @renderer_objects = {}
    end

    def input(type, attribute, options = {})
      renderer(type).render attribute, options
    end


    private

    def renderer(type)
      renderer_class = "B3Form::FormElements::#{type.to_s.camelize}".constantize
      renderer_objects[type] ||= renderer_class.new(self)
    rescue
      raise ArgumentError, "Unknown input type: #{type}"
    end
  end
end
