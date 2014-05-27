module B3Form
  class Input::Select < Input::TopLevelElement
    def render_field
      if render_called_with_block
        builder.modifier[:select_options]  = {}
        builder.modifier[:select_modifier] = {}
        builder.modifier[:select_field]    = field

        builder.capture(&render_called_with_block)
        html = builder.select(field,
                              builder.modifier[:select_options],
                              builder.modifier[:select_modifier],
                              input_html)

        builder.modifier.delete(:select_field)
        builder.modifier.delete(:select_modifier)
        builder.modifier.delete(:select_options)

        html
      else
        raise ArgumentError, "call with block to set the select options"
      end
    end


    private

    def input_html
      input_options = super

      add_to_options(input_options, :class, "form-control")

      if options[:select_size]
        add_to_options(input_options, :size, options[:select_size])
      end

      if options[:multiple]
        add_to_options(input_options, :multiple, options[:multiple])
      end

      input_options
    end
  end
end
