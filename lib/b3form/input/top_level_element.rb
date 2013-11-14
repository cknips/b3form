module B3Form
  class Input::TopLevelElement < Input
    def render
      super

      render_wrapper do
        render_label +
        render_input_column do
          render_input_group do
            render_field
          end +
          (render_hints_aside?  ? '' : render_hint) +
          (render_errors_aside? ? '' : render_errors)
        end +
        (render_hints_aside?  ? render_hint : '') +
        (render_errors_aside? ? render_errors : '')
      end
    end


    def render_label
      rendered_label = super

      if form_horizontal?
        if label_column_width
          if rendered_label.blank?
            render_offset
          else
            rendered_label
          end
        else
          if rendered_label.blank?
            ''.html_safe
          else
            render_full_width_column do
              rendered_label
            end
          end
        end
      else
        rendered_label
      end
    end


    private

    def label_html
      label_options = super

      if label_column_width
        add_to_options(label_options, :class, label_column_width)
      end

      label_options
    end
  end
end
