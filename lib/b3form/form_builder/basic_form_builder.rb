module B3Form
  class FormBuilder::BasicFormBuilder < FormBuilder
    def initialize(object_name, object, template, options)
      super

      modifier[:form_layout] = :basic
    end


    def default_radio_layout
      :stacked
    end
  end
end
