module B3Form
  class Input::TextLike < Input
    def render
      render_wrapper do
        if builder.modifier[:form_layout] == :basic
          if builder.modifier[:input_column_width]
            render_input_column do
              render_label +
              render_field +
              (builder.modifier[:hint_column_width] ? '' : render_hint) +
              (builder.modifier[:error_column_width] ? '' : render_errors)
            end
          else
            render_label +
            render_field +
            (builder.modifier[:hint_column_width] ? '' : render_hint) +
            (builder.modifier[:error_column_width] ? '' : render_errors)
          end
        elsif builder.modifier[:form_layout] == :horizontal
          render_label +
          render_input_column do
            render_field_tag
            (builder.modifier[:hint_column_width] ? '' : render_hint) +
            (builder.modifier[:error_column_width] ? '' : render_errors)
          end
        end +
        (builder.modifier[:error_column_width] ? render_errors : '') +
        (builder.modifier[:hint_column_width] ? render_hint : '')
      end
    end


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
