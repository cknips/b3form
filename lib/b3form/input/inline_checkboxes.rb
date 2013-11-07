module B3Form
  class Input::InlineCheckboxes < Input::TopLevelElement

    private

    def render_field
      checkboxes_html = nil
      builder.change_checkbox_layout :inline do
        builder.modifier[:checkbox_group]  = true
        
        checkboxes_html = if render_called_with_block
          builder.capture(&render_called_with_block)
        else
          ''
        end
        
        builder.modifier.delete(:checkbox_group)
      end

      checkboxes_html
    end
  end
end
