module B3Form
  module ViewHelpers
    module GlyphiconHelper
      def glyphicon(key)
        content_tag :span, "", class: "glyphicon glyphicon-#{key}"
      end


      def with_glyphicon(key, spaces: 1, &block)
        "#{glyphicon key}#{"&nbsp;" * spaces.to_i}#{capture &block}".html_safe
      end
    end
  end
end
