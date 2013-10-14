module B3Form
  class Output::ErrorAlert < Output
    def render
      errors = object.errors

      if errors[field].any?
        builder.content_tag :div, class: 'alert alert-danger' do
          errors.full_messages_for(field).join(', ')
        end
      end
    end
  end
end
