module B3Form
  class Input::RadioOption < Input
    def render
      if builder.modifier[:radio_layout] == :inline
        render_label do
          render_field +
          option_text_from_option_or_i18n(value)
        end
      else
        content_tag(:div, class: 'radio') do
          render_label do
            render_field +
            option_text_from_option_or_i18n(value)
          end
        end
      end
    end


    def render_field
      builder.radio_button(field, value, input_html)                                          
    end


    private
    
    # The "field" parameter (the first parameter of the helper) is used for the
    # value of the actual field. The actual field is set by the radio_group
    # helper
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

      input_options[:checked] = true if options[:checked]

      input_options
    end
  end
end
