module B3Form
  class Input::Password < Input::TextLike
    def render_field
      builder.password_field(field, input_html)
    end
  end
end
