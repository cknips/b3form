module B3Form
  class Button
    attr_reader :builder, :options

    def initialize(builder, options)
      @builder = builder
      @options = options
    end


    def render
      raise NotImplementedError, 'implement in subclass'
    end


    def render_button
      if label_text
        builder.button(label_text, button_html)
      else
        builder.button(button_html)
      end
    end


    private

    def button_html
      button_options = options[:button_html] || {}

      if button_options.include? :class
        if button_options[:class] =~ /btn-.*/
          button_options[:class] << ' btn btn-default'
        else
          button_options[:class] << ' btn'
        end
      else
        button_options[:class] = 'btn btn-default'
      end

      add_to_options(button_options, :disabled, true)        if options[:disabled]
      add_to_options(button_options, :class, options[:size]) if options[:size]

      button_options
    end


    def label_text
      options[:label]
    end
  end
end
