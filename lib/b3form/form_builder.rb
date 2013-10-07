module B3Form
  class FormBuilder < ActionView::Helpers::FormBuilder
    delegate :content_tag, :tag, to: :@template


    def submit_button(options = {})
      button = Button::Submit.new(self, options)

      button.render_button
    end
  end
end
