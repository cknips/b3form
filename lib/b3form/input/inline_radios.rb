module B3Form
  class Input::InlineRadios < Input::TopLevelElement

    private

    def render_field
      radios_html = nil
      builder.change_radio_layout :inline do
        builder.modifier[:radio_field] = field
        
        radios_html = if render_called_with_block
          builder.capture(&render_called_with_block)
        else
          ''
        end
        
        builder.modifier.delete(:radio_field)
      end

      radios_html
    end
  end
end
