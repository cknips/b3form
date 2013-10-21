module B3Form
  class Input::InlineRadios < Input
    include Input::Concerns::RenderRadios


    def render(&block)
      builder.modifier[:radio_layout] = :inline
      builder.modifier[:radio_field]  = field
      
      radios_html = render_radios(&block)
      
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
