module B3Form
  module HelperMethods
    def add_to_options(hash, key, value)
      if hash.include? key
        hash[key] << ' ' + value
      else
        hash[key] = value
      end
    end


    def translate(primary_key, object_name, field, value = nil)
      translation =
        if value
          I18n.t "helpers.#{primary_key}.#{object_name}.#{field}.#{value}",
                  default: '__missing__'
        else
          I18n.t "helpers.#{primary_key}.#{object_name}.#{field}",
                  default: '__missing__'
        end

      if translation == '__missing__'
        translation =
          if value
            I18n.t "helpers.#{primary_key}.default.#{field}.#{value}",
                    default: '__missing__'
          else
            I18n.t "helpers.#{primary_key}.default.#{field}",
                    default: '__missing__'
          end
      end

      translation
    end
  end
end
