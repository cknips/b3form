module B3Form
  class Button
    include HelperMethods

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

      if button_options[:class] =~ /btn-.*/
        add_to_options(button_options, :class, 'btn')
      else
        add_to_options(button_options, :class, 'btn btn-default')
      end

      add_to_options(button_options, :disabled, true)        if options[:disabled]
      add_to_options(button_options, :class, options[:size]) if options[:size]
      add_to_options(button_options, :id, options[:id])      if options[:id]

      button_options
    end


    def label_text
      options[:label]
    end
  end
end
