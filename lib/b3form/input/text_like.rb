module B3Form
  class Input::TextLike < Input::TopLevelElement

    private

    def input_html
      input_options = super

      add_to_options(input_options, :class, 'form-control')
      input_options[:placeholder] = placeholder_text if placeholder_text

      input_options
    end


    def placeholder_text
      option_or_i18n(:placeholder)
    end
  end
end
