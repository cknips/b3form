module B3Form
  class Input::StackedRadios < Input
    def render(&block)
      radios_html = nil

      builder.change_radio_layout :stacked do
        builder.modifier[:radio_field] = field
        
        radios_html = block_given? ? builder.capture(&block) : ''
        
        builder.modifier.delete(:radio_field)
      end

      render_wrapper do
        render_input_column do
          render_label + 
          radios_html
        end +
        render_hint +
        render_errors
      end
    end
  end
end
