module B3Form
  module FormElements
    class Text < Base
      private

      def render_input
        builder.text_field(field, input_html)
      end
    end
  end
end
