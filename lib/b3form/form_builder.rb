module B3Form
  class FormBuilder < ActionView::Helpers::FormBuilder
    delegate :content_tag, :tag, to: :@template


    def input(type, field, options = {})
      renderer(type, field, options).render
    end


    private

    def renderer(type, field, options)
      renderer_class = "B3Form::FormElements::#{type.to_s.camelize}".constantize
      renderer_class.new(self, field, options)
    rescue
      raise ArgumentError, "Unknown input type: #{type}"
    end
  end
end
