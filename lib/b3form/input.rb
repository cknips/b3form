module B3Form
  class Input
    include HelperMethods

    attr_reader :builder, :field, :options, :render_called_with_block

    def initialize(builder, field, options)
      @builder  = builder
      @field    = field
      @options  = options
    end

    delegate :object, :content_tag, to: :builder


    def render(&block)
      @render_called_with_block = block if block_given?
    end


    def render_wrapper(&block)
      content_tag :div, wrapper_html, &block
    end


    def render_label(&block)
      builder.label(field, label_html) do
        if block_given?
          block.call
        else
          label_text
        end
      end
    end


    def render_input_column(&block)
      if form_horizontal?
        input_column_options = { class: input_column_width }
        content_tag :div, input_column_options, &block
      else
        block.call
      end
    end


    def render_errors
      errors.map { |message|
        errors_class = if error_column_width
          "help-block aside #{error_column_width}"
        else
          'help-block'
        end

        content_tag :div, class: errors_class do
          message
        end
      }.join(', ').html_safe
    end


    def render_hint
      if hint_text
        hint_class = if hint_column_width
          "hint-block aside #{hint_column_width}"
        else
          'hint-block'
        end

        content_tag :div, class: hint_class do
          hint_text
        end
      else
        ''.html_safe
      end
    end


    def render_offset
      if label_column_width
        content_tag :div, nil, class: label_column_width
      else
        ''.html_safe
      end
    end


    def render_full_width_column(&block)
      content_tag :div, class: 'col-xs-12 col-sm-12 col-md-12 col-lg-12', &block
    end


    def render_input_group(&block)
      block.call
    end


    private

    def wrapper_html
      wrapper_options = options[:wrapper_html] || {}

      add_to_options(wrapper_options, :class, 'form-group')
      add_to_options(wrapper_options, :class, 'has-error') if has_error?

      wrapper_options
    end


    def input_html
      input_options = options[:input_html] || {}

      add_to_options(input_options, :disabled, true)        if options[:disabled]
      add_to_options(input_options, :class, options[:size]) if options[:size]
      add_to_options(input_options, :id, options[:id])      if options[:id]

      input_options
    end


    def label_html
      label_options = options[:label_html] || {}

      add_to_options(label_options, :class, 'control-label')

      label_options
    end


    def label_text(&block)
      option_or_i18n(:label)
    end


    def hint_text
      option_or_i18n(:hint)
    end


    def option_or_i18n(key)
      option = options[key]

      if option.nil?
        helper_text_from_i18n(key)
      else
        option
      end
    end

    
    def helper_text_from_i18n(key)
      return false unless field

      translation =
        I18n.t "helpers.#{key}.#{object.class.model_name.i18n_key}.#{field}",
                default: '__missing__'

      if translation == '__missing__'
        translation =
          I18n.t "helpers.#{key}.#{object.class.model_name.i18n_key}.#{field}_html",
                  default: '__missing__'
      end

      if translation == '__missing__'
        translation =
          I18n.t "helpers.#{key}.default.#{field}",
                  default: '__missing__'
      end

      if translation == '__missing__'
        translation =
          I18n.t "helpers.#{key}.default.#{field}_html",
                  default: '__missing__'
      end

      if translation == '__missing__'
        false
      else
        translation.html_safe
      end
    end


    def errors
      @errors ||= object.errors.messages[field] || []
    end


    def has_error?
      @has_error ||= errors.any?
    end


    def render_hints_aside?
      !!hint_column_width
    end


    def render_errors_aside?
      !!error_column_width
    end


    def form_basic?
      builder.modifier[:form_layout] == :basic
    end

    def form_horizontal?
      builder.modifier[:form_layout] == :horizontal
    end

    def form_inline?
      builder.modifier[:form_layout] == :inline
    end


    def label_column_width
      builder.modifier[:label_column_width]
    end

    def input_column_width
      builder.modifier[:input_column_width]
    end

    def hint_column_width
      builder.modifier[:hint_column_width]
    end

    def error_column_width
      builder.modifier[:error_column_width]
    end
  end
end
