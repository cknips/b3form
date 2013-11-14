module B3Form
  class Input::SelectOptions < Input
    def render
      builder.modifier[:select_options].merge! select_options

      if options[:include_blank]
        builder.modifier[:select_modifier][:include_blank] = options[:include_blank]
      end

      if options[:selected]
        builder.modifier[:select_modifier][:selected] = options[:selected]
      end

      if options[:disabled]
        builder.modifier[:select_modifier][:disabled] ||= []
        builder.modifier[:select_modifier][:disabled]  += Array[options[:disabled]]
      end

      nil
    end


    private
    
    # The "field" parameter (the first parameter of the helper) is used as the
    # collection to render the radio options. The actual field is set by the
    # select_input helper
    alias_method :field_orig, :field
    alias_method :collection, :field_orig
    def field
      builder.modifier[:select_field]
    end


    def select_options
      return {} unless collection.respond_to? :first

      # if first element is an Array, it's either
      #   - a Hash:            { value_1: 'label_1', value_2: 'label_2' }
      #   - or a nested Array: [[:value_1, 'label_1'], [:value_2, 'label_2']]
      # we need to convert it to an Array in any case to use #merge!
      if collection.first.kind_of? Array
        Hash[collection]
      # else treat as Array: [:value_1, :value_2]
      else
        collection.each_with_object({}) do |value, hash|
          hash[option_text_from_option_or_i18n(value)] = value
        end
      end
    end
  end
end
