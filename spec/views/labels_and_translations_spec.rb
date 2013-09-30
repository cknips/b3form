require 'spec_helper'

describe 'labels and translations' do
  let(:task) { Task.new(title: 'Test Title') }
  before     { assign :task, task }


  describe 'of inputs' do

# View:
#
# <%= f.text_input :title
#
# HTML:
#
# <div class="form-group">
#   <label for="task_title" class="control-label">as in translation file</label>
#   <input type="text" class="form-control" name="task_title">
# </div>

    it 'uses the correct translations' do
      render template: 'tests/labels_and_translations'

      expect(page).to have_content 'Titel'
    end

# View:
#
# <%= f.text_input :title, label: 'Custom Text'
#
# HTML:
#
# <div class="form-group">
#   <label for="task_title" class="control-label">Custom Text</label>
#   <input type="text" class="form-control" name="task_title">
# </div>

    it 'can be used with custom text for the label' do
      render template: 'tests/labels_and_translations'

      expect(page).to have_content 'Custom Input'
    end

# View:
#
# <%= f.text_input :title, label: false
#
# HTML:
#
# <div class="form-group">
#   <input type="text" class="form-control" name="task_title">
# </div>

    it 'omits the label if `label: false is used' do
      render template: 'tests/labels_and_translations'

      expect(page).not_to have_css 'form div.form-group label#input-ommited-label'
    end
  end


  describe 'of buttons' do

# View:
#
# <%= f.submit_button %>
#
# HTML:
#
# <button type="submit" class="btn btn-default">as in translation file</button>

    it 'uses the correct translations' do
      render template: 'tests/labels_and_translations'

      expect(page).to have_content 'Aufgabe speichern'
    end

# View:
#
# <%= f.submit_button 'Custom Text' %>
#
# HTML:
#
# <button type="submit" class="btn btn-default">Custom Text</button>

    it 'can be used with custom text' do
      render template: 'tests/labels_and_translations'

      expect(page).to have_content 'Custom Button'
    end
  end
end
