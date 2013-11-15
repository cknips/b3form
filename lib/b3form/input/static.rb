module B3Form
  class Input::Static < Input::TopLevelElement
    def render_field
      content_tag :p, input_html do
        options[:value]
      end
    end


    private

    def input_html
      input_options = super

      add_to_options(input_options, :class, 'form-control-static')

      input_options
    end
  end
end
