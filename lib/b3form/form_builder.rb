module B3Form
  class FormBuilder < ActionView::Helpers::FormBuilder
    delegate :content_tag, :tag, to: :@template


    def error_alert(field, options = {})
      error_alert = Output::ErrorAlert.new(self, field, options)

      error_alert.render
    end


    def submit_button(options = {})
      button = Button::Submit.new(self, options)

      button.render_button
    end
  end
end
