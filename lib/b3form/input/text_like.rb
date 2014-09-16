module B3Form
  class Input::TextLike < Input::TopLevelElement

    def render_input_group(&block)
      input_prepend        = options[:prepend]
      input_append         = options[:append]

      input_prepend_button = options[:prepend_button]
      input_append_button  = options[:append_button]

      if input_prepend || input_append
        content_tag :div, class: 'input-group' do
          if input_prepend
            content_tag :span, input_prepend, class: 'input-group-addon'
          else
            ''.html_safe
          end +
          block.call +
          if input_append
            content_tag :span, input_append, class: 'input-group-addon'
          else
            ''.html_safe
          end
        end
      elsif input_prepend_button || input_append_button
        content_tag :div, class: 'input-group' do
          if input_prepend_button
            content_tag :div, input_prepend_button, class: 'input-group-btn'
          else
            ''.html_safe
          end +
          block.call +
          if input_append_button
            content_tag :div, input_append_button, class: 'input-group-btn'
          else
            ''.html_safe
          end
        end
      else
        block.call
      end
    end


    private

    def input_html
      input_options = super

      add_to_options(input_options, :class, 'form-control')

      input_options[:placeholder] = placeholder_text if placeholder_text
      input_options[:value]       = options[:value]  if options[:value]

      input_options
    end


    def placeholder_text
      @placeholder_text ||= option_or_i18n(:placeholder)
    end
  end
end
