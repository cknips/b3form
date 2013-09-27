module B3Form
  module FormElements
    class Text < Base
      def render(attribute, options)
        if options.include? :class
          options[:class] << ' form-control'
        else
          options[:class] = 'form-control'
        end
        
        builder.text_field(attribute, options)
      end
    end
  end
end
