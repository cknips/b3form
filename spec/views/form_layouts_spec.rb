require 'spec_helper'

describe 'form' do
  before { assign(:test_model, TestModel.new) }

# View:
#
# <%= b3_form_for @test_model do |f| %>
# <% end %>
#
# HTML:
#
# <form role="form">
# </form>

  describe 'b3_form_for' do
    it 'renders a form with role = "form" attribute' do
      render template: 'test_models/form_layouts.html.erb'

      expect(page).to have_css 'form[role=form]'
    end
  end
end
