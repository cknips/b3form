require 'spec_helper'

describe 'exception handling' do

# View:
#
# <%= b3_form_for @model do |f| %>
#   <%= f.input :unknown, :attribute %>
#               ^^^^^^^^   undefined input type
# <% end %>

  it 'raises an error if unknown form input should be rendered' do
    expect {
      render template: 'tasks/failure.html.erb'
    }.to raise_error ActionView::Template::Error
  end
end
