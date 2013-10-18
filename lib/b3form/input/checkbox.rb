module B3Form
  class Input::Checkbox < Input
    def render
      if builder.modifier[:checkbox_group]
        render_inner
      else
        render_wrapper do
          render_inner
        end
      end
    end


    def render_field
      builder.check_box(field, input_html)
    end


    private

    def render_inner
      if builder.modifier[:checkbox_layout] == :inline
        render_label do
          render_field
        end
      else
        render_input_column do
          builder.content_tag(:div, class: 'checkbox') do
            render_label do
              render_field
            end +
            render_errors
          end
        end
      end
    end

    
    def label_text(&block)
      block.call + super
    end


    def label_html
      if builder.modifier[:checkbox_layout] == :inline
        label_options = super

        add_to_options(label_options, :class, 'checkbox-inline')

        label_options
      else
        super
      end
    end
  end
end
