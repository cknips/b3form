module B3Form
  class Input::Number < Input
    def render_field
      builder.number_field(field, input_html)
    end
  end
end
