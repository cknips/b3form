module B3Form
  class Input::Email < Input
    def render_field
      builder.email_field(field, input_html)
    end
  end
end
