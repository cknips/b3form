module B3Form
  module ViewHelpers
    module GlyphiconHelper
      def glyphicon(key)
        content_tag :span, '', class: "glyphicon glyphicon-#{key}"
      end
    end
  end
end
