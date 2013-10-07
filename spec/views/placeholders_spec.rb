require 'spec_helper'

describe 'Hints' do
  let(:task) { Task.new }
  before     { assign :task, task }

# View
# --------
# <%= f.text_input :placeholder_test_omitted %>
# <%= f.text_input :placeholder_test %>
# <%= f.text_input :placeholder_test_omitted, placeholder: 'Overridden Omitted Placeholder' %>
# <%= f.text_input :placeholder_test, placeholder: 'Overridden Test Placeholder' %>
#
# de.yml
# --------
# helpers:
#   placeholder:
#     task:
#       placeholder_test: placeholder test
#
# HTML:
#
# <div class="form-group">
#   <label for="task_placeholder_test_omitted" class="control-label">Text</label>
#   <input type="text" class="form-control" name="task_placeholder_test_omitted">
# </div>
# <div class="form-group">
#   <label for="task_placeholder_test" class="control-label">Text</label>
#   <input type="text" class="form-control" name="task_placeholder_test" placeholder="Placeholder Test">
# </div>
# <div class="form-group">
#   <label for="task_placeholder_test_omitted" class="control-label">Text</label>
#   <input type="text" class="form-control" name="task_placeholder_test_omitted" placeholder="Overridden Omitted Placeholder">
# </div>
# <div class="form-group">
#   <label for="task_placeholder_test" class="control-label">Text</label>
#   <input type="text" class="form-control" name="task_placeholder_test" placeholder="Overridden Test Placeholder">
# </div>

  it 'does not add a placeholder if none is defined in translation file or '\
     'passed as option' do
    render template: 'tests/placeholders'

    expect(page).to have_no_css 'form div.form-group:nth-child(2) input[placeholder]'
  end

  it 'adds a placeholder if defined in translation file' do
    render template: 'tests/placeholders'

    expect(page).to have_css 'form div.form-group:nth-child(3) input[placeholder="Placeholder Test"]'
  end

  it 'adds a placeholder if passed as option' do
    render template: 'tests/placeholders'

    expect(page).to have_css 'form div.form-group:nth-child(4) input[placeholder="Overridden Omitted Placeholder"]'
  end

  it 'uses the placeholder passed as option even if another placeholder is '\
     'defined in translation file' do
    render template: 'tests/placeholders'

    expect(page).to have_css 'form div.form-group:nth-child(5) input[placeholder="Overridden Test Placeholder"]'
  end
end
