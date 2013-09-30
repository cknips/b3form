module B3Form
  class Button::Submit < Button
    private

    def render_button
      button_html[:type] = :submit

      if label_text
        builder.button(label_text, button_html)
      else
        builder.button(button_html)
      end
    end
  end
end
