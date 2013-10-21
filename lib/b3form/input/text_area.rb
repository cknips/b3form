module B3Form
  class Input::TextArea < Input::TextLike
    def render_field
      builder.text_area(field, input_html)
    end
  end
end
