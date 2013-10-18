module B3Form
  class FormBuilder::BasicFormBuilder < FormBuilder
    def text_input(field, options = {})
      Input::Text.new(self, field, options).render
    end

    def password_input(field, options = {})
      Input::Password.new(self, field, options).render
    end

    def search_input(field, options = {})
      Input::Search.new(self, field, options).render
    end

    def url_input(field, options = {})
      Input::Url.new(self, field, options).render
    end

    def email_input(field, options = {})
      Input::Email.new(self, field, options).render
    end

    def number_input(field, options = {})
      Input::Number.new(self, field, options).render
    end

    def checkbox_input(field, options = {})
      Input::Checkbox.new(self, field, options).render
    end


    def stacked_checkboxes(field = nil, options = {}, &block)
      Input::StackedCheckboxes.new(self, field, options).render(&block)
    end

    def inline_checkboxes(field = nil, options = {}, &block)
      Input::InlineCheckboxes.new(self, field, options).render(&block)
    end
  end
end
