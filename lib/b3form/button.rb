module B3Form
  class Button
    attr_reader :builder, :options

    def initialize(builder, options)
      @builder = builder
      @options = options
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

      button_options
    end


    def label_text
      options[:label]
    end
  end
end
