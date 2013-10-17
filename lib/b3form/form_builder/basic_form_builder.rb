module B3Form
  class FormBuilder::BasicFormBuilder < FormBuilder
    def text_input(field, options = {})
      text_style_input(Input::Text, field, options)
    end

    def password_input(field, options = {})
      text_style_input(Input::Password, field, options)
    end

    def search_input(field, options = {})
      text_style_input(Input::Search, field, options)
    end

    def url_input(field, options = {})
      text_style_input(Input::Url, field, options)
    end

    def email_input(field, options = {})
      text_style_input(Input::Email, field, options)
    end

    def number_input(field, options = {})
      text_style_input(Input::Number, field, options)
    end


    private

    def text_style_input(input_class, field, options)
      input = input_class.new(self, field, options)

      input.render_wrapper do
        input.render_label +
        input.render_field +
        input.render_errors +
        input.render_hint
      end
    end
  end
end
