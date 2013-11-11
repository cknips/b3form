module B3Form
  class Input::ComposedInput < Input::TopLevelElement

    private

    def render_field
      html        = nil
      form_layout = builder.modifier[:form_layout]

      builder.modifier[:form_layout] = :inline

      html = if render_called_with_block
        content_tag :div, class: 'form-inline' do
          builder.capture(&render_called_with_block)
        end
      else
        ''.html_safe
      end

      builder.modifier[:form_layout] = form_layout

      html
    end
  end
end
