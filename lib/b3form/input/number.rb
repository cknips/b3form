module B3Form
  class Input::Number < Input::TextLike
    def render_field
      builder.number_field(field, input_html)
    end
  end
end
