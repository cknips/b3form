module B3Form
  class Input::StackedCheckboxes < Input
    def render(&block)
      builder.modifier[:checkbox_layout] = :stacked
      builder.modifier[:checkbox_group]  = true
      
      checkboxes_html = block_given? ? builder.capture(&block) : ''
      
      builder.modifier[:checkbox_layout] = FormBuilder::DEFAULT_CHECKBOX_LAYOUT
      builder.modifier.delete(:checkbox_group)

      render_wrapper do
        render_label + 
        render_input_column do
          checkboxes_html
        end
      end
    end
  end
end
