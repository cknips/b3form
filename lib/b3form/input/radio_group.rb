module B3Form
  class Input::RadioGroup < Input::TopLevelElement
    attr_reader :layout

    def initialize(*)
      super

      @layout = options[:layout] || builder.default_radio_layout
    end


    def render_label
      if form_basic? && layout == :inline
        super + '<br>'.html_safe
      else
        super
      end
    end


    private

    def render_field
      html = nil
      
      builder.modifier[:radio_field]        = field
      builder.modifier[:radio_layout]       = layout
      builder.modifier[:inside_radio_group] = true
      
      html = builder.capture(&render_called_with_block) if render_called_with_block
      
      builder.modifier.delete(:inside_radio_group)
      builder.modifier[:radio_layout] = builder.default_radio_layout
      
      html || ''.html_safe
    end
  end
end
