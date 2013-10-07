require 'spec_helper'

describe 'submit button' do
  let(:task) { Task.new }
  before     { assign :task, task }

# View
# --------
# <%= f.submit_button %>
# <%= f.submit_button 'Overridden Button' %>
#
# de.yml
# --------
# helpers:
#   submit:
#     task:
#       create: Submit Task (create)
#
# HTML
# --------
# <button type="submit" class="btn btn-default">Submit Task (create)</button>
# <button type="submit" class="btn btn-default">Overridden Button Text</button>

  it 'renders a submit button with class="btn btn-default"' do
    render template: 'tests/submit_button'

    expect(page).to have_css 'form button[type=submit]'
  end

  it 'uses the translations from the translation file' do
    render template: 'tests/submit_button'

    expect(page).to have_content 'Submit Task (create)'
  end

  it 'uses the passed label although a translation is given in the translation' \
     'file' do
    render template: 'tests/submit_button'

    expect(page).to have_content 'Overridden Button Text'
  end
end
