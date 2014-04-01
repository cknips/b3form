require 'spec_helper'

describe 'form' do
  before { assign(:test_model, TestModel.new) }

# View:
#
# = b3_form_for @test_model do |f|
#   &nbsb;
#
# HTML:
#
# <form role="form">
# </form>

  describe 'b3_form_for' do
    it 'renders a form with role = "form" attribute' do
      html = render template: 'test_models/form_layouts'

      expect(page(html)).to have_css 'form[role=form]'
    end
  end


# View:
#
# = b3_horizontal_form_for @test_model do |f|
#   &nbsb;
#
# HTML:
#
# <form class="form-horizontal" role="form">
# </form>

  describe 'b3_form_for' do
    it 'renders a form with role = "form" attribute' do
      html = render template: 'test_models/form_layouts'

      expect(page(html)).to have_css 'form[role=form][class=form-horizontal]'
    end
  end  
end
