module B3Form
  class Input::RadioOption < Input
    def render
      if builder.modifier[:radio_layout] == :inline
        render_label do
          render_field +
          label_option_or_translation
        end
      else
        content_tag(:div, class: 'radio') do
          render_label do
            render_field +
            label_option_or_translation
          end
        end
      end
    end


    def render_field
      builder.radio_button(field, value, input_html)                                          
    end


    private
    
    # The "field" parameter (the first parameter of the helper) is used for the
    # value of the actual field. The actual field is set by the stacked_radios
    # and inline_radios helpers
    alias_method :field_orig, :field
    alias_method :value, :field_orig
    def field
      builder.modifier[:radio_field]
    end
    

    def label_html
      label_options = super

      if builder.modifier[:radio_layout] == :inline
        add_to_options(label_options, :class, 'radio-inline')
      end
      
      label_options
    end


    def input_html
      input_options = super

      add_to_options(input_options, :checked, true) if options[:checked]

      input_options
    end


    def label_option_or_translation
      return options[:label] if options[:label].present?

      model_name = 
        if object.class.respond_to? :model_name
          object.class.model_name.i18n_key
        else
          object.to_s
        end

      translation =
        I18n.t "helpers.option.#{model_name}.#{field}.#{value}",
                default: '__missing__'

      if translation == '__missing__'
        translation =
          I18n.t "helpers.options.default.#{field}.#{value}",
                  default: '__missing__'
      end

      if translation == '__missing__'
        value
      elsif translation == false
        false
      else
        translation.html_safe
      end
    end
  end
end
