module B3Form
  class Input::SubmitButton < Input::Button

    private

    def input_html
      input_options = super

      add_to_options(input_options, :type, :submit)

      input_options
    end
    

    def label_text
      translation = super
      return translation if translation

      if field
        translation = label_text_from_i18n(:submit)
      end
      return translation if translation

      if object.respond_to?(:persisted?)
        translation =
          if object.persisted?
            translate(:submit, builder.object_name, :update)
          else
            translate(:submit, builder.object_name, :create)
          end
        return translation unless translation == '__missing__'
      end
      
      translation = translate(:submit, builder.object_name, :submit)
      return translation unless translation == '__missing__'

      'Submit'
    end
  end
end
