module B3Form
  class FormBuilder < ActionView::Helpers::FormBuilder
    delegate :content_tag, :tag, to: :@template


#   Inputs    

    def text_input(field, options = {})
      Input::Text.new(self, field, options).render
    end


#   Buttons

    def submit_button(options = {})
      Button::Submit.new(self, options).render
    end
  end
end
