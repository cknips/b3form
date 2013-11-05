module B3Form
  class Input::Checkbox < Input
    def render
      if builder.modifier[:checkbox_group]
        render_inner
      else
        render_wrapper do
          render_input_column do
            render_inner
          end
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
        builder.content_tag(:div, class: 'checkbox') do
          render_label do
            render_field
          end +
          render_errors
        end
      end
    end

    
    def label_text(&block)
      block.call + super
    end


    def label_html
      label_options = options[:label_html] || {}

      if builder.modifier[:radio_layout] == :inline
        add_to_options(label_options, :class, 'checkbox-inline')
      end
      
      label_options
    end
  end
end
