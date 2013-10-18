module B3Form
  class Input::StackedCheckboxes < Input
    def render(&block)
      builder.modifier[:checkbox_layout] = :stacked
      checkboxes_html = block_given? ? builder.capture(&block) : ''
      builder.modifier[:checkbox_layout] = FormBuilder::DEFAULT_CHECKBOX_LAYOUT

      render_label + checkboxes_html
    end
  end
end
