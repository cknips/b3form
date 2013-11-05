module B3Form
  class FormBuilder < ActionView::Helpers::FormBuilder
    delegate :content_tag, :tag, :capture, to: :@template

    attr_reader :modifier

    def initialize(object_name, object, template, options)
      super

      @modifier = {
        checkbox_layout: default_checkbox_layout,
        radio_layout:    default_radio_layout
      }

      column_params                  = options[:columns]     || {}
      @modifier[:label_column_width] = column_params[:label]
      @modifier[:input_column_width] = column_params[:input]
      @modifier[:hint_column_width]  = column_params[:hint]
      @modifier[:error_column_width] = column_params[:error]
    end



#
#   Modifier
#


    def default_checkbox_layout
      raise NotImplementedError, 'implement in subclass'
    end

    def change_checkbox_layout(layout, &block)
      modifier[:checkbox_layout] = layout
      block.call      
      modifier[:checkbox_layout] = default_checkbox_layout
    end


    def default_radio_layout
      raise NotImplementedError, 'implement in subclass'
    end

    def change_radio_layout(layout, &block)
      modifier[:radio_layout] = layout
      block.call      
      modifier[:radio_layout] = default_radio_layout
    end


#
#   Input Elements
#


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

    def radio_option(value, options = {})
      Input::RadioOption.new(self, value, options).render
    end

    def radio_options(collection, options = {})
      Input::RadioOptions.new(self, collection, options).render
    end

    def text_area_input(value, options = {})
      Input::TextArea.new(self, value, options).render
    end


#
#   Input Helpers
#


    def stacked_checkboxes(field = nil, options = {}, &block)
      Input::StackedCheckboxes.new(self, field, options).render(&block)
    end

    def inline_checkboxes(field = nil, options = {}, &block)
      Input::InlineCheckboxes.new(self, field, options).render(&block)
    end

    def stacked_radios(field, options = {}, &block)
      Input::StackedRadios.new(self, field, options).render(&block)
    end

    def inline_radios(field, options = {}, &block)
      Input::InlineRadios.new(self, field, options).render(&block)
    end


#
#   Other Helpers
#
    

    def error_alert(field, options = {})
      Helper::ErrorAlert.new(self, field, options).render
    end


#
#   Buttons
#


    def submit_button(options = {})
      Button::Submit.new(self, options).render_button
    end
  end
end
