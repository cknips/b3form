module B3Form
  class Input::Text < Input
    def render_field
      builder.text_field(field, input_html)
    end
  end
end
