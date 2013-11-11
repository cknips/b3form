module B3Form
  module HelperMethods
    def add_to_options(hash, key, value)
      if hash.include? key
        hash[key] << ' ' + value
      else
        hash[key] = value
      end
    end


    def label_option_or_translation(options, object_name, field, value)
      return options[:label] if options[:label].present?

      translation =
        I18n.t "helpers.option.#{object_name}.#{field}.#{value}",
                default: '__missing__'

      if translation == '__missing__'
        translation =
          I18n.t "helpers.options.default.#{field}.#{value}",
                  default: '__missing__'
      end

      if translation == '__missing__'
        value
      elsif translation == false
        false
      else
        translation.html_safe
      end
    end
  end
end
