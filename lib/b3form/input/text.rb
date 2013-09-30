module B3Form
  class Input::Text < Input
    private

    def render_input
      builder.text_field(field, input_html)
    end
  end
end
