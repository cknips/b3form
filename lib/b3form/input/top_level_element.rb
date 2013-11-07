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


    private

    def render_label
      if form_horizontal? &&
         !label_column_width
        render_full_width_column do
          super
        end
      else
        super
      end
    end


    def label_html
      label_options = super

      if label_column_width
        add_to_options(label_options, :class, label_column_width)
      end

      label_options
    end
  end
end
