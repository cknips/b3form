module B3Form
  class Input::Search < Input::TextLike
    def render_field
      builder.search_field(field, input_html)
    end
  end
end
