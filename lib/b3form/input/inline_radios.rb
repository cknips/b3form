module B3Form
  class Input::InlineRadios < Input
    def render(&block)
      radios_html = nil

      builder.change_radio_layout :inline do
        builder.modifier[:radio_field] = field
        radios_html = block_given? ? builder.capture(&block) : ''
        builder.modifier.delete(:radio_field)
      end

      render_wrapper do
        render_label + 
        render_input_column do
          radios_html
        end +
        render_errors
      end
    end
  end
end
