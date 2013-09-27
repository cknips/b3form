require 'spec_helper'

describe 'basic form elements' do
  before { assign(:task, Task.new) }

  it 'renders a form' do
    render template: 'tasks/new.html.erb'

    expect(page rendered).to have_css 'form'
  end
end
