module B3Form
  class Input
    attr_reader :builder, :field, :options

    def initialize(builder, field, options)
      @builder = builder
      @field   = field
      @options = options
    end


    def render_wrapper
      builder.content_tag :div, wrapper_html do
        yield
      end
    end


    def render_label
      if label_text
        builder.label(field, label_text, label_html)
      else
        ''.html_safe
      end
    end


    def render_errors
      errors.map { |message|
        builder.content_tag :div, class: 'help-block' do
          message
        end
      }.join(', ').html_safe
    end


    def render_hint
      if hint_text
        builder.content_tag :div, class: 'hint' do
          hint_text
        end
      else
        ''.html_safe
      end
    end


    private


    def wrapper_html
      wrapper_options = options[:wrapper_html] || {}

      if wrapper_options.include? :class
        wrapper_options[:class] << ' form-group'
      else
        wrapper_options[:class] = 'form-group'
      end

      wrapper_options[:class] << ' has-error' if has_error?

      wrapper_options
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


    def label_html
      label_options = options[:label_html] || {}

      if label_options.include? :class
        label_options[:class] << ' control-label'
      else
        label_options[:class] = 'control-label'
      end

      label_options
    end


    def label_text
      option_or_i18n(:label)
    end

    
    def placeholder_text
      option_or_i18n(:placeholder)
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
      translation =
        I18n.t "helpers.#{key}.#{builder.object.class.model_name.i18n_key}.#{field}",
                default: '__missing__'

      if translation == '__missing__'
        translation =
          I18n.t "helpers.#{key}.#{builder.object.class.model_name.i18n_key}.#{field}_html",
                  default: '__missing__'
      end

      if translation == '__missing__'
        false
      else
        translation.html_safe
      end
    end


    def errors
      @errors ||= builder.object.errors.messages[field] || []
    end


    def has_error?
      @has_error ||= errors.any?
    end
  end
end
