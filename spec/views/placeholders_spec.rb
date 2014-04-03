require 'spec_helper'

describe 'Hints' do
  let(:test_model) { TestModel.new }
  before           { assign :test_model, test_model }
  let(:html)       { render template: 'test_models/placeholders' }

# View
# --------
# = f.text_input :placeholder_test_omitted
# = f.text_input :placeholder_test
# = f.text_input :placeholder_test_omitted, placeholder: 'Overridden Omitted Placeholder'
# = f.text_input :placeholder_test, placeholder: 'Overridden Test Placeholder'
#
# de.yml
# --------
# helpers:
#   placeholder:
#     test_model:
#       placeholder_test: placeholder test
#
# HTML:
#
# <div class="form-group">
#   <label for="test_model_placeholder_test_omitted" class="control-label">Text</label>
#   <div>
#     <input type="text" class="form-control" name="test_model_placeholder_test_omitted">
#   </div>
# </div>
# <div class="form-group">
#   <label for="test_model_placeholder_test" class="control-label">Text</label>
#   <div>
#     <input type="text" class="form-control" name="test_model_placeholder_test" placeholder="Placeholder Test">
#   </div>
# </div>
# <div class="form-group">
#   <label for="test_model_placeholder_test_omitted" class="control-label">Text</label>
#   <div>
#     <input type="text" class="form-control" name="test_model_placeholder_test_omitted" placeholder="Overridden Omitted Placeholder">
#   </div>
# </div>
# <div class="form-group">
#   <label for="test_model_placeholder_test" class="control-label">Text</label>
#   <div>
#     <input type="text" class="form-control" name="test_model_placeholder_test" placeholder="Overridden Test Placeholder">
#   </div>
# </div>

  it 'does not add a placeholder if none is defined in translation file or '\
     'passed as option' do
    expect(page(html)).to have_no_css 'form div.form-group:nth-child(2) input[placeholder]'
  end

  it 'adds a placeholder if defined in translation file' do
    expect(page(html)).to have_css 'form div.form-group:nth-child(3) input[placeholder="Placeholder Test"]'
  end

  it 'adds a placeholder if passed as option' do
    expect(page(html)).to have_css 'form div.form-group:nth-child(4) input[placeholder="Overridden Omitted Placeholder"]'
  end

  it 'uses the placeholder passed as option even if another placeholder is '\
     'defined in translation file' do
    expect(page(html)).to have_css 'form div.form-group:nth-child(5) input[placeholder="Overridden Test Placeholder"]'
  end
end
