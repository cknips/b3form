require 'spec_helper'

describe 'form' do
  before { assign(:task, Task.new) }

# View:
#
# <%= b3_form_for @model do |f| %>
# <% end %>
#
#
# HTML:
#
# <form role="form">
# </form>

  it 'renders a form with role = "form" attribute' do
    render template: 'tasks/new.html.erb'

    expect(page rendered).to have_css 'form[role=form]'
  end
end
