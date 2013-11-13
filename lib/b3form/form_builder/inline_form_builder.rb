module B3Form
  class FormBuilder::InlineFormBuilder < FormBuilder
    def initialize(object_name, object, template, options)
      super

      modifier[:form_layout] = :inline
    end


    def default_radio_layout
      :inline
    end
  end
end
