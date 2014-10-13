module B3Form
  module ViewHelpers
    module GlyphiconHelper
      def glyphicon(key)
        content_tag :span, "", class: "glyphicon glyphicon-#{key}"
      end


      def with_glyphicon(key, &block)
        "#{glyphicon key}#{"&nbsp;&nbsp;"}#{capture &block}".html_safe
      end
    end
  end
end
