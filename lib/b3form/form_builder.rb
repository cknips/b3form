module B3Form
  class FormBuilder < ActionView::Helpers::FormBuilder
    delegate :content_tag, :tag, :capture, to: :@template

    attr_reader :modifier

    def initialize(object_name, object, template, options)
      super

      @modifier = {
        radio_layout:    default_radio_layout
      }
    end



#
#   Modifier and defaults
#


    def set_column(column, value)
      modifier[:"#{column}_column_width"] = value
    end

    def default_radio_layout
      raise NotImplementedError, 'implement in subclass'
    end


#
#   Input Elements
#


    def text_input(field, options = {}, &block)
      Input::Text.new(self, field, options).render(&block)
    end

    def password_input(field, options = {}, &block)
      Input::Password.new(self, field, options).render(&block)
    end

    def search_input(field, options = {}, &block)
      Input::Search.new(self, field, options).render(&block)
    end

    def url_input(field, options = {}, &block)
      Input::Url.new(self, field, options).render(&block)
    end

    def email_input(field, options = {}, &block)
      Input::Email.new(self, field, options).render(&block)
    end

    def number_input(field, options = {}, &block)
      Input::Number.new(self, field, options).render(&block)
    end

    def checkbox_input(field, options = {}, &block)
      Input::Checkbox.new(self, field, options).render(&block)
    end

    def radio_option(value, options = {}, &block)
      Input::RadioOption.new(self, value, options).render(&block)
    end

    def radio_options(collection, options = {}, &block)
      Input::RadioOptions.new(self, collection, options).render(&block)
    end

    def text_area_input(value, options = {}, &block)
      Input::TextArea.new(self, value, options).render(&block)
    end

    def select_input(value, options = {}, &block)
      Input::Select.new(self, value, options).render(&block)
    end

    def select_option(value, options = {}, &block)
      Input::SelectOption.new(self, value, options).render(&block)
    end

    def blank_select_option(blank_value = true)
      Input::SelectOption.blank_select_option(self, blank_value)
    end

    def select_options(collection, options = {}, &block)
      Input::SelectOptions.new(self, collection, options).render(&block)
    end

    def static_input(field, options = {}, &block)
      Input::Static.new(self, field, options).render(&block)
    end

    def submit_button(name_or_options = nil, options = {})
      if name_or_options.kind_of? Hash
        Input::SubmitButton.new(self, nil, name_or_options).render
      else
        Input::SubmitButton.new(self, name_or_options, options).render
      end
    end


#
#   Input and Button Helpers
#


    def radio_group(field = nil, options = {}, &block)
      Input::RadioGroup.new(self, field, options).render(&block)
    end
    
    alias_method :checkbox_group, :radio_group


    def composed_input(field, options = {}, &block)
      Input::ComposedInput.new(self, field, options).render(&block)
    end


    def form_actions(options = {}, &block)
      Input::FormActions.new(self, nil, options).render(&block)
    end


#
#   Other Helpers
#
    

    def error_alert(field, options = {})
      Helper::ErrorAlert.new(self, field, options).render
    end
  end
end
