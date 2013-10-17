module B3Form
  class Input::TextLike < Input
    def render
      render_wrapper do
        render_label  +
        render_field  +
        render_errors +
        render_hint
      end
    end


    private

    def wrapper_css_class
      'form-group'
    end


    def label_text(&block)
      option_or_i18n(:label)
    end


    def label_html
      label_options = options[:label_html] || {}

      if label_options.include? :class
        label_options[:class] << ' control-label'
      else
        label_options[:class] = 'control-label'
      end

      label_options
    end


    def input_html
      input_options = options[:input_html] || {}

      if input_options.include? :class
        input_options[:class] << ' form-control'
      else
        input_options[:class] = 'form-control'
      end

      input_options[:placeholder] = placeholder_text if placeholder_text

      input_options
    end


    def placeholder_text
      option_or_i18n(:placeholder)
    end
  end
end
