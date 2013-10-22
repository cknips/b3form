module B3Form
  class Input::StackedRadios < Input
    def render(&block)
      builder.modifier[:radio_layout] = :stacked
      builder.modifier[:radio_field]  = field
      
      radios_html = block_given? ? builder.capture(&block) : ''
      
      builder.modifier[:radio_layout] = FormBuilder::DEFAULT_RADIO_LAYOUT
      builder.modifier.delete(:radio_field)

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
