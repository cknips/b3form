module B3Form
  module HelperMethods
    def add_to_options(hash, key, value)
      if hash.include? key
        hash[key] << ' ' + value
      else
        hash[key] = value
      end
    end


    def i18n_key(object)
         builder.modifier[:object_i18n_key] \
      || object.class.try(:model_name).try(:i18n_key) \
      || builder.object_name
    end


    def translate(primary_key, object, field, value = nil)
      translation =
        if value
          I18n.t "b3_form.#{primary_key}.#{i18n_key(object)}.#{field}.#{value}",
                  default: '__missing__'
        else
          I18n.t "b3_form.#{primary_key}.#{i18n_key(object)}.#{field}",
                  default: '__missing__'
        end

      if translation == '__missing__'
        translation =
          if value
            I18n.t "b3_form.#{primary_key}.default.#{field}.#{value}",
                    default: '__missing__'
          else
            I18n.t "b3_form.#{primary_key}.default.#{field}",
                    default: '__missing__'
          end
      end

      translation
    end
  end
end
