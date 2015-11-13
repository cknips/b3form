module B3Form
  class Input::Checkbox < Input
    def render
      if builder.modifier[:inside_radio_group]
        render_inner
      else
        render_wrapper do
          render_offset +
          render_input_column do
            render_inner +
            (render_hints_aside?  ? '' : render_hint) +
            (render_errors_aside? ? '' : render_errors)
          end +
          (render_hints_aside?  ? render_hint : '') +
          (render_errors_aside? ? render_errors : '')
        end
      end
    end


    def render_field
      builder.check_box(field, input_html)
    end


    private

    def render_inner
      if builder.modifier[:radio_layout] == :inline
        render_label do
          render_field +
          label_text
        end
      else
        content_tag(:div, class: 'checkbox') do
          render_label do
            render_field +
            label_text
          end
        end
      end
    end


    def input_html
      input_options = super

      input_options[:checked] = true if options[:checked]

      input_options
    end


    def label_html
      label_options = super

      if builder.modifier[:radio_layout] == :inline
        add_to_options(label_options, :class, 'checkbox-inline')
      end

      label_options
    end
  end
end
