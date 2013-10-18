module B3Form
  class Input::Checkbox < Input
    def render
      render_wrapper do
        render_label do
          render_field
        end +
        render_errors
      end
    end


    def render_field
      builder.check_box(field, input_html)
    end


    private

    def wrapper_css_class
      'checkbox'
    end

    
    def label_text(&block)
      block.call + super
    end
  end
end
