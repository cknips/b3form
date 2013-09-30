require 'spec_helper'

describe 'buttons' do
  let(:task) { Task.new(title: 'Test Title') }
  before     { assign :task, task }


  describe 'submit button' do

# View:
#
# <%= f.submit_button %>
#
# HTML:
#
# <button type="submit" class="btn btn-default">Submit</button>

    it 'renders a submit button with class="btn btn-default"' do
      render template: 'tests/submit_button'

      expect(page).to have_css 'form button[type=submit]'
    end
  end
end
