module B3Form
  class Input::RadioOptions < Input
    def render
      return '' unless collection.respond_to? :first

      # if first element is an Array, it's either
      #   - a Hash:            { 'label_1' => :value_1, 'label_2' => :value_2 }
      #   - or a nested Array: [['label_1', :value_1], ['label_2', :value_2]]
      if collection.first.kind_of? Array
        Hash[collection].map { |label, value|
          builder.radio_option value, label: label
        }.join.html_safe
      # else treat as Array: [:value_1, :value_2]
      else
        collection.map { |value|
          builder.radio_option value
        }.join.html_safe
      end
    end


    private
    
    # The "field" parameter (the first parameter of the helper) is used as the
    # collection to render the radio options. The actual field is set by the
    # radio_group helper
    alias_method :field_orig, :field
    alias_method :collection, :field_orig
    def field
      builder.modifier[:radio_field]
    end
  end
end
