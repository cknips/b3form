module B3Form
  class Input::RadioGroup < Input::TopLevelElement

    private

    def render_field
      html   = nil
      layout = options[:layout] || builder.default_radio_layout
      
      builder.modifier[:radio_field]        = field
      builder.modifier[:radio_layout]       = layout
      builder.modifier[:inside_radio_group] = true
      
      html = builder.capture(&render_called_with_block) if render_called_with_block
      
      builder.modifier.delete(:inside_radio_group)
      builder.modifier[:radio_layout] = builder.default_radio_layout
      
      html || ''.html_safe
    end
  end
end
