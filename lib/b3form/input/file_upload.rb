module B3Form
  class Input::FileUpload < Input::TextLike
    def render_field
      builder.file_field(field, input_html)
    end
  end
end
