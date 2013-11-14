module B3Form
  class Input::Button < Input
    def render
      builder.button(label_text, input_html)
    end


    private

    def input_html
      input_options = super

      if input_options[:class] =~ /btn-.*/
        add_to_options(input_options, :class, 'btn')
      else
        add_to_options(input_options, :class, 'btn btn-default')
      end

      input_options[:name] = field if field

      input_options
    end


    def label_text
      options[:label]
    end
  end
end
