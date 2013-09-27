module B3Form
  module ViewHelpers
    module FormBuilderHelper
      def b3_form_for(object, options = {}, &block)
        options[:builder]     = B3Form::FormBuilder
        options[:html]      ||= {}
        options[:html][:role] = 'form'
        form_for(object, options, &block)
      end
    end
  end
end
