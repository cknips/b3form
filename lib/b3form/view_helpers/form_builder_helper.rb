module B3Form
  module ViewHelpers
    module FormBuilderHelper
      include HelperMethods


      def b3_form_for(object, options = {}, &block)
        options[:builder] = B3Form::FormBuilder::BasicFormBuilder
        options[:html]  ||= {}
        
        add_to_options(options[:html], :role,  'form')

        form_for(object, options, &block)
      end


      def b3_horizontal_form_for(object, options = {}, &block)
        options[:builder] = B3Form::FormBuilder::HorizontalFormBuilder
        options[:html]  ||= {}

        add_to_options(options[:html], :class, 'form-horizontal')
        add_to_options(options[:html], :role,  'form')
        
        form_for(object, options, &block)
      end


      def b3_inline_form_for(object, options = {}, &block)
        options[:builder] = B3Form::FormBuilder::InlineFormBuilder
        options[:html]  ||= {}

        add_to_options(options[:html], :class, 'form-inline')
        add_to_options(options[:html], :role,  'form')
        
        form_for(object, options, &block)
      end
    end
  end
end
