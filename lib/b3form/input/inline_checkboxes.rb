module B3Form
  class Input::InlineCheckboxes < Input
    def render(&block)
      checkboxes_html = nil

      builder.change_checkbox_layout :inline do
        builder.modifier[:checkbox_group]  = true
        checkboxes_html = block_given? ? builder.capture(&block) : ''
        builder.modifier.delete(:checkbox_group)
      end

      render_wrapper do
        render_label +
        render_input_column do
          checkboxes_html
        end
      end
    end
  end
end
