module B3Form
  module Input::Concerns
    module RenderRadios
      private

      def render_radios(&block)
        if block_given?
          builder.capture(&block)
        elsif options[:collection].present?
          collection = options[:collection]
          return '' unless collection.respond_to? :first

          # if first element is an Array, it's either a nested Array or a Hash
          # treat as { value_1: 'label_1', value_2: 'label_2' } or as
          # [[:value_1, 'label_1'], [:value_2, 'label_2']]
          if collection.first.kind_of? Array
            Hash[collection].map { |value, label|
              builder.radio_option value, label: label
            }.join.html_safe
          # else treat as [:value_1, :value_2]
          else
            collection.map { |value|
              builder.radio_option value
            }.join.html_safe
          end
        else
          ''
        end
      end
    end
  end
end
