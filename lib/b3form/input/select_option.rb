module B3Form
  class Input::SelectOption < Input
    def render
      builder.modifier[:select_options][option_text_from_option_or_i18n] = value
      
      if options[:selected]
        builder.modifier[:select_modifier][:selected] = value
      end

      if options[:disabled]
        builder.modifier[:select_modifier][:disabled] ||= []
        builder.modifier[:select_modifier][:disabled] <<  value
      end

      nil
    end


    def self.blank_select_option(builder, blank_value = true)
      builder.modifier[:select_modifier][:include_blank] = blank_value
    end


    private
    
    # The "field" parameter (the first parameter of the helper) is used for the
    # value of the actual field. The actual field is set by the select_input
    # helper
    alias_method :field_orig, :field
    alias_method :value, :field_orig
    def field
      builder.modifier[:select_field]
    end
  end
end
