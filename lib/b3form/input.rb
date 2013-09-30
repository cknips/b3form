module B3Form
  class Input
    attr_reader :builder, :field, :options

    def initialize(builder, field, options)
      @builder = builder
      @field   = field
      @options = options
    end

    
    def render
      render_wrapper do
        render_label +
        render_input +
        render_errors
      end
    end


    private

    def render_wrapper
      builder.content_tag :div, wrapper_html do
        yield
      end
    end


    def render_label
      if label_text == false
        ''.html_safe
      elsif label_text.nil?
        builder.label(field, label_html)
      else
        builder.label(field, label_text, label_html)
      end
    end


    def render_input
      raise NotImplementedError, 'implement in subclass'
    end


    def render_errors
      errors.map { |message|
        builder.content_tag :small, class: 'help-block' do
          message
        end
      }.join(', ').html_safe
    end


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
      options[:label]
    end


    def errors
      @errors ||= builder.object.errors.messages[field] || []
    end


    def has_error?
      @has_error ||= errors.any?
    end
  end
end
