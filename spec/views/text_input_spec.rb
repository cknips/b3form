require 'spec_helper'

describe 'text input' do

# View:
#
# <%= f.input :text, :attribute %>
#
#
# HTML:
#
# <input type="text" class="form-control">

  it 'renders a text input' do
    render template: 'tasks/text_input.html.erb'

    expect(page rendered).to have_css '#form-1 input[type=text]'
    expect(page rendered).to have_css '#form-1 input[class=form-control]'
  end
end
