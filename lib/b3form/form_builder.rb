module B3Form
  class FormBuilder < ActionView::Helpers::FormBuilder
    delegate :content_tag, :tag, to: :@template


    def text_input(field, options = {})
      Input::Text.new(self, field, options).render
    end
  end
end
