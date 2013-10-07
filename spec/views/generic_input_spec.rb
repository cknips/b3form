require 'spec_helper'

describe 'generic input features' do
  let(:task) { Task.new(title: 'Test Title') }
  before     { assign :task, task }

# View:
#
# <%= f.text_input :title %>
#
# HTML:
#
# <div class="form-group">
#   <label for="task_title" class="control-label">Text</label>
#   <input type="text" class="form-control" name="task_title">
# </div>

  it 'renders a text input with class="form-control" and a label with '\
     'class="control-label", wrapped in a div with class="form-group"' do
    render template: 'tests/generic_input'

    expect(page).to have_css 'form div.form-group label[for=task_title]'
    expect(page).to have_css 'form div.form-group label.control-label'

    expect(page).to have_css 'form div.form-group input[type=text]'
    expect(page).to have_css 'form div.form-group input.form-control'
  end


  describe 'error class' do
    before { task.title = '' and task.valid? }

# View:
#
# <%= f.text_input :title %>
# with :title having a validation error
#
# HTML:
#
# <div class="form-group has-error">
#   <label for="task_title" class="control-label">Text</label>
#   <input type="text" class="form-control" name="task_title">
#   <div class="help-block">Error message</div>
# </div>

    it 'adds has-error class to form-group if object has an error on the field '\
       'and puts error message under input tag' do
      render template: 'tests/generic_input'

      expect(page).to have_css 'form div.form-group.has-error'
      expect(page).to have_css 'form div.help-block'
    end

    it 'omits the field_with_errors div rendered by the rails form builder' do
      render template: 'tests/generic_input'

      expect(page).to have_no_css 'form div.field_with_errors'
    end
  end
end
