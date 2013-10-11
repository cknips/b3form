require 'spec_helper'

describe 'generic input features' do
  let(:test_model) { TestModel.new }
  before           { assign :test_model, test_model }

# View:
#
# <%= f.text_input :email %>
#
# HTML:
#
# <div class="form-group">
#   <label for="test_model_title" class="control-label">Text</label>
#   <input type="text" class="form-control" name="test_model_title">
# </div>

  it 'renders a text input with class="form-control" and a label with '\
     'class="control-label", wrapped in a div with class="form-group"' do
    render template: 'test_models/generic_input'

    expect(page).to have_css 'form div.form-group label[for=test_model_email]'
    expect(page).to have_css 'form div.form-group label.control-label'

    expect(page).to have_css 'form div.form-group input[type=text]'
    expect(page).to have_css 'form div.form-group input.form-control'
  end


  describe 'error class' do

# View:
#
# <%= f.text_input :email %>   <- with :email having a validation error
#
# HTML:
#
# <div class="form-group has-error">
#   <label for="test_model_title" class="control-label">Text</label>
#   <input type="text" class="form-control" name="test_model_title">
#   <div class="help-block">Error message</div>
# </div>

    before { test_model.email = '' and test_model.valid? }

    it 'adds has-error class to form-group if object has an error on the field '\
       'and puts error message under input tag' do
      render template: 'test_models/generic_input'

      expect(page).to have_css 'form div.form-group.has-error'
      expect(page).to have_css 'form div.help-block'
    end

    it 'omits the field_with_errors div rendered by the rails by default' do
      render template: 'test_models/generic_input'

      expect(page).to have_no_css 'form div.field_with_errors'
    end
  end
end
