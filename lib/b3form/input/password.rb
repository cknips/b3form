module B3Form
  class Input::Password < Input
    def render_field
      builder.password_field(field, input_html)
    end
  end
end
