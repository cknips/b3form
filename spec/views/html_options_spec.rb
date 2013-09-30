require 'spec_helper'


describe 'html options' do
  let(:task) { Task.new(title: 'Test Title') }
  before     { assign :task, task }  


  describe 'label_html' do

# View:
#
# <%= f.text_input :title, label_html: { id: 'label_id' }
#
# HTML:
#
# <div class="form-group">
#   <label for="task_title" class="control-label">Text</label>
#   <input type="text" class="form-control" name="task_title" placeholder="text">
# </div>

    it 'passes through attributes for the label tag, preserves given classes' do
      render template: 'tests/html_options'

      expect(page).to have_css 'form label[for=task_title]'
      expect(page).to have_css 'form label#label_id'
      expect(page).to have_css 'form label.col-lg-2.control-label'
    end
  end


  describe 'input_html' do

# View:
#
# <%= f.text_input :title, input_html: { placeholder: 'text', class: 'input-lg' }
#
# HTML:
#
# <div class="form-group">
#   <label for="task_title" class="control-label">Text</label>
#   <input type="text" class="form-control input-lg" name="task_title" placeholder="text">
# </div>

    it 'passes through attributes for the input tag, preserves given classes' do
      render template: 'tests/html_options'

      expect(page).to have_css 'form input[type=text]'
      expect(page).to have_css 'form input.input-lg.form-control'
      expect(page).to have_css 'form input[placeholder=text]'
    end
  end


  describe 'wrapper_html' do

# View:
#
# <%= f.text_input :title, wrapper_html: { id: 'wrapper_id', class: 'has-success' }
#
# HTML:
#
# <div class="form-group" id="wrapper_id">
#   <label for="task_title" class="control-label">Text</label>
#   <input type="text" class="form-control" name="task_title" placeholder="text">
# </div>

    it 'passes through attributes for the wrapper div tag, preserves given classes' do
      render template: 'tests/html_options'

      expect(page).to have_css 'form div.form-group.has-success'
      expect(page).to have_css 'form div.form-group#wrapper_id'
    end
  end
end
