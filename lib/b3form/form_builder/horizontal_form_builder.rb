module B3Form
  class FormBuilder::HorizontalFormBuilder < FormBuilder
    def initialize(object_name, object, template, options)
      super

      modifier[:form_layout]        = :horizontal
      
      column_params                 = options[:columns] || {}
      modifier[:label_column_width] = column_params[:label]
      modifier[:input_column_width] = column_params[:input]
      modifier[:hint_column_width]  = column_params[:hint]
      modifier[:error_column_width] = column_params[:error]
    end


    def default_radio_layout
      :stacked
    end
  end
end
