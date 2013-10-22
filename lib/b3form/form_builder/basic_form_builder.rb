module B3Form
  class FormBuilder::BasicFormBuilder < FormBuilder
    def initialize(*)
      super
    end


    def default_checkbox_layout
      :stacked
    end


    def default_radio_layout
      :stacked
    end
  end
end
