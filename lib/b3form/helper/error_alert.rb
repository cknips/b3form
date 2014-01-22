module B3Form
  class Helper::ErrorAlert < Helper
    def render
      errors = object.errors

      if errors[field].any?
        content_tag :div, class: 'alert alert-danger' do
          errors.full_messages_for(field).join(', ').html_safe
        end
      end
    end
  end
end
