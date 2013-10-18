module B3Form
  class Input::Radio < Input
    def render
      if builder.modifier[:radio_layout] == :inline
        render_label do
          render_field
        end
      else
        builder.content_tag(:div, class: 'radio') do
          render_label do
            render_field
          end
        end
      end
    end


    def render_field
      builder.radio_button(field, value, input_html)                                          
    end


    private
    
    # The "field"-parameter (being the first parameter) is used for the value
    # of the actual field. The field is set by the stacked_radios and
    # inline_radios helpers
    alias_method :field_orig, :field
    alias_method :value, :field_orig
    def field
      builder.modifier[:radio_field]
    end


    def label_text(&block)
      block.call + value_translation
    end


    def label_html
      if builder.modifier[:radio_layout] == :inline
        label_options = super
        add_to_options(label_options, :class, 'radio-inline')
        label_options
      else
        super
      end
    end


    def value_translation
      translation =
        I18n.t "helpers.options.#{object.class.model_name.i18n_key}.#{field}.#{value}",
                default: '__missing__'

      if translation == '__missing__'
        translation =
          I18n.t "helpers.options.#{object.class.model_name.i18n_key}.#{field}.#{value}_html",
                  default: '__missing__'
      end

      if translation == '__missing__'
        value
      else
        translation.html_safe
      end
    end
  end
end
