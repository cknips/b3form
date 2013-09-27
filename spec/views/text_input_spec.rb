require 'spec_helper'

describe 'text input' do
  let(:task) { Task.new(title: 'Test Title') }
  before     { assign :task, task }

# View:
#
# <%= f.input :text, :title %>
#
# HTML:
#
# <div class="form-group">
#   <label for="task_title" class="control-label">Text</label>
#   <input type="text" class="form-control" name="task_title">
# </div>

  it 'renders a text input with class="form-control" and a label with '\
     'class="control-label", wrapped in a div with class="form-group"' do
    render template: 'tasks/text_input.html.erb'

    expect(page).to have_css '#form-1 div.form-group[class=form-group] label[for=task_title]'
    expect(page).to have_css '#form-1 div.form-group[class=form-group] label[class=control-label]'

    expect(page).to have_css '#form-1 div.form-group[class=form-group] input[type=text]'
    expect(page).to have_css '#form-1 div.form-group[class=form-group] input[class=form-control]'
  end

# View:
#
# <%= f.input :text, :title, label_html: { id: 'label_id' }
#
# HTML:
#
# <div class="form-group">
#   <label for="task_title" class="control-label">Text</label>
#   <input type="text" class="form-control" name="task_title" placeholder="text">
# </div>

  it 'passes through attributes for the label tag' do
    render template: 'tasks/text_input.html.erb'

    expect(page).to have_css '#form-2 label[for=task_title]'
    expect(page).to have_css '#form-2 label[id=label_id]'
  end

# View:
#
# <%= f.input :text, :title, label_html: { class: 'col-lg-2' }
#
# HTML:
#
# <div class="form-group">
#   <label for="task_title" class="col-lg-2 control-label">Text</label>
#   <input type="text" class="form-control" name="task_title">
# </div>

  it 'preserves given classes for the label tag' do
    render template: 'tasks/text_input.html.erb'

    expect(page).to have_css '#form-3 label[for=task_title]'
    expect(page).to have_css '#form-3 label[class="col-lg-2 control-label"]'
  end

# View:
#
# <%= f.input :text, :title, input_html: { placeholder: 'text' }
#
# HTML:
#
# <div class="form-group">
#   <label for="task_title" class="control-label">Text</label>
#   <input type="text" class="form-control" name="task_title" placeholder="text">
# </div>

  it 'passes through attributes for the input tag' do
    render template: 'tasks/text_input.html.erb'

    expect(page).to have_css '#form-4 input[type=text]'
    expect(page).to have_css '#form-4 input[class=form-control]'
    expect(page).to have_css '#form-4 input[placeholder=text]'
  end

# View:
#
# <%= f.input :text, :title, input_html: { class: 'input-lg' }
#
# HTML:
#
# <div class="form-group">
#   <label for="task_title" class="control-label">Text</label>
#   <input type="text" class="form-control input-lg" name="task_title">
# </div>

  it 'preserves given classes for the input tag' do
    render template: 'tasks/text_input.html.erb'

    expect(page).to have_css '#form-5 input[type=text]'
    expect(page).to have_css '#form-5 input[class="input-lg form-control"]'
  end

# View:
#
# <%= f.input :text, :title, wrapper_html: { id: 'wrapper_id' }
#
# HTML:
#
# <div class="form-group" id="wrapper_id">
#   <label for="task_title" class="control-label">Text</label>
#   <input type="text" class="form-control" name="task_title" placeholder="text">
# </div>

  it 'passes through attributes for the wrapper div tag' do
    render template: 'tasks/text_input.html.erb'

    expect(page).to have_css '#form-6 div.form-group[class=form-group]'
    expect(page).to have_css '#form-6 div.form-group[id=wrapper_id]'
  end

# View:
#
# <%= f.input :text, :title, wrapper_html: { class: 'has-success' }
#
# HTML:
#
# <div class="form-group">
#   <label for="task_title" class="control-label">Text</label>
#   <input type="text" class="form-control input-lg" name="task_title">
# </div>

  it 'preserves given classes for the wrapper div tag' do
    render template: 'tasks/text_input.html.erb'

    expect(page).to have_css '#form-7 div.form-group[class="has-success form-group"]'
  end

# View:
#
# <%= f.input :text, :title %>
# with title having a validation error
#
# HTML:
#
# <div class="form-group has-error">
#   <label for="task_title" class="control-label">Text</label>
#   <input type="text" class="form-control" name="task_title">
#   <small class="help-block">Error message</small>
# </div>

  it 'adds has-error class to form-group if object has an error on the field '\
     'and puts error message under input tag' do
    task.title = '' and task.valid?
    render template: 'tasks/text_input.html.erb'

    expect(page).to have_css '#form-1 div.form-group[class="form-group has-error"]'
    expect(page).to have_css '#form-1 small[class=help-block]'
  end
end
