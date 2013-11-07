module B3Form
  class Button::Submit < Button
    def render
      button_html[:type] = :submit

      render_button
    end
  end
end
