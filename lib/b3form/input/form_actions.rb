module B3Form
  class Input::FormActions < Input
    def render(&block)
      render_wrapper do
        if form_basic?
          block.call
        elsif form_horizontal?
          if label_column_width
            render_offset +
            content_tag(:div, class: label_column_width, &block)
          else
            render_full_width_column &block
          end
        end
      end
    end


    private

    def wrapper_html
      wrapper_options = super

      add_to_options(wrapper_options, :class, 'form-actions form-inline')

      wrapper_options
    end
  end
end
