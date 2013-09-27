module B3Form
  class Railtie < Rails::Railtie
    initializer 'b3form.view_helpers' do
      ActionView::Base.class_eval do
        include ViewHelpers::FormBuilderHelper
      end
    end
  end
end
