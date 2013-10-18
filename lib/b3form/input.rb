module B3Form
  class Input
    attr_reader :builder, :field, :options

    def initialize(builder, field, options)
      @builder  = builder
      @field    = field
      @options  = options
    end

    delegate :object, to: :builder


    def render
      raise NotImplementedError, 'implement in subclass'
    end


    def render_wrapper(&block)
      builder.content_tag :div, wrapper_html, &block
    end


    def render_label(&block)
      rendered_label_text = label_text(&block)

      if rendered_label_text
        builder.label(field, label_html) do
          rendered_label_text
        end
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
        wrapper_options[:class] << ' '
        wrapper_options[:class] << wrapper_css_class
      else
        wrapper_options[:class] = wrapper_css_class
      end

      wrapper_options[:class] << ' has-error' if has_error?

      wrapper_options
    end


    def input_html
      options[:input_html] || {}
    end


    def label_html
      options[:label_html] || {}
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


    def wrapper_css_class
      raise NotImplementedError, 'implement in subclass'
    end
  end
end
