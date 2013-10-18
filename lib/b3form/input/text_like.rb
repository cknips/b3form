module B3Form
  class Input::TextLike < Input
    def render
      render_wrapper do
        render_label  +
        render_input_column do
          render_field
        end +
        render_errors +
        render_hint
      end
    end


    private

    def label_html
      label_options = super
      
      add_to_options(label_options, :class, 'control-label')

      label_options
    end


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
