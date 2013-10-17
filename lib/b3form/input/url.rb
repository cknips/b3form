module B3Form
  class Input::Url < Input::TextLike
    def render_field
      builder.url_field(field, input_html)
    end
  end
end
