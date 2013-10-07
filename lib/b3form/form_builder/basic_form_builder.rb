module B3Form
  class FormBuilder::BasicFormBuilder < FormBuilder
    def text_input(field, options = {})
      input = Input::Text.new(self, field, options)

      input.render_wrapper do
        input.render_label +
        input.render_field +
        input.render_errors +
        input.render_hint
      end
    end
  end
end
