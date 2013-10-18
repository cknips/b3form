module B3Form
  class FormBuilder < ActionView::Helpers::FormBuilder
    DEFAULT_CHECKBOX_LAYOUT = :stacked
    DEFAULT_RADIO_LAYOUT    = :stacked


    delegate :content_tag, :tag, :capture, to: :@template


    attr_reader :modifier

    def initialize(*)
      super

      @modifier = {
        checkbox_layout: DEFAULT_CHECKBOX_LAYOUT,
        radio_layout:    DEFAULT_RADIO_LAYOUT
      }
    end


    def error_alert(field, options = {})
      Helper::ErrorAlert.new(self, field, options).render
    end


    def submit_button(options = {})
      Button::Submit.new(self, options).render_button
    end
  end
end
