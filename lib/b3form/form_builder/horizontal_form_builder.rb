module B3Form
  class FormBuilder::HorizontalFormBuilder < FormBuilder
    def initialize(object_name, object, template, options)
      super

      modifier[:form_layout]          = :horizontal
      modifier[:label_column_width] ||= 'col-lg-3'
      modifier[:input_column_width] ||= 'col-lg-9'
    end


    def default_checkbox_layout
      :stacked
    end


    def default_radio_layout
      :stacked
    end
  end
end
