require 'spec_helper'

describe 'labels' do
  let(:test_model) { TestModel.new }
  before           { assign :test_model, test_model }

# View
# --------
# = f.text_input :label_test_omitted
# = f.text_input :label_test_omitted, label: 'Overridden Omitted Label'
# = f.text_input :label_test_omitted, label: false
# = f.text_input :label_test
# = f.text_input :label_test, label: 'Overridden Label Test'
# = f.text_input :label_test, label: false
# = f.text_input :label_test_html
# = f.text_input :label_test_html, label: 'Overridden Label Test Html'
# = f.text_input :label_test_html, label: false
#
# de.yml
# --------
# helpers:
#   label:
#     test_model:
#       label_test: Label Test
#       label_test_html: Label <b>Test</b>
#
# HTML
# --------
# <div class="form-group">
#   <div>
#     <input type="text" class="form-control" name="test_model_title">
#   </div>
# </div>
#
# <div class="form-group">
#   <label for="test_model_label_test_omitted" class="control-label">Overridden Omitted Label</label>
#   <div>
#     <input type="text" class="form-control" name="test_model_label_test_omitted">
#   </div>
# </div>
#
# <div class="form-group">
#   <div>
#     <input type="text" class="form-control" name="test_model_label_test_omitted">
#   </div>
# </div>
#
# <div class="form-group">
#   <label for="test_model_label_test" class="control-label">Label Test</label>
#   <div>
#     <input type="text" class="form-control" name="test_model_label_test">
#   </div>
# </div>
#
# <div class="form-group">
#   <label for="test_model_label_test" class="control-label">Overridden Label Test</label>
#   <div>
#     <input type="text" class="form-control" name="test_model_label_test">
#   </div>
# </div>
#
# <div class="form-group">
#   <div>
#     <input type="text" class="form-control" name="test_model_label_test">
#   </div>
# </div>
#
# <div class="form-group">
#   <label for="test_model_label_test_html" class="control-label">Label <b>Test</b></label>
#   <div>
#     <input type="text" class="form-control" name="test_model_label_test_html">
#   </div>
# </div>
#
# <div class="form-group">
#   <label for="test_model_label_test_html" class="control-label">Overridden Label Test Html</label>
#   <div>
#     <input type="text" class="form-control" name="test_model_label_test_html">
#   </div>
# </div>
#
# <div class="form-group">
#   <div>
#     <input type="text" class="form-control" name="test_model_label_test_html">
#   </div>
# </div>

  it 'omits the label if none is defined in translation file or passed as option' do
    render template: 'test_models/labels'

    expect(page).to have_no_css 'form div.form-group:nth-child(2) label'
  end

  it 'inserts a label if passed as option' do
    render template: 'test_models/labels'

    expect(page).to have_css 'form div.form-group:nth-child(3) label'
    expect(page).to have_content 'Overridden Omitted Label'
  end

  it 'omits a label option `label: false` passed' do
    render template: 'test_models/labels'

    expect(page).to have_no_css 'form div.form-group:nth-child(4) label'
  end

  it 'inserts a label if defined in translation file' do
    render template: 'test_models/labels'

    expect(page).to have_css 'form div.form-group:nth-child(5) label'
    expect(page).to have_content 'Label Test'
  end

  it 'inserts a label if defined in translation file but overridden by passed '\
     'option' do
    render template: 'test_models/labels'

    expect(page).to have_css 'form div.form-group:nth-child(6) label'
    expect(page).to have_content 'Overridden Label Test'
  end

  it 'omits a label if option `label: false` passed although defined in '\
     'translation file' do
    render template: 'test_models/labels'

    expect(page).to have_no_css 'form div.form-group:nth-child(7) label'
  end

  it 'inserts a label if defined in translation file as html' do
    render template: 'test_models/labels'

    expect(page).to have_css 'form div.form-group:nth-child(8) label'
    expect(page).to have_css 'form div.form-group:nth-child(8) label b'
  end

  it 'inserts a label if defined in translation file as html but overridden by '\
     'passed option' do
    render template: 'test_models/labels'

    expect(page).to have_css 'form div.form-group:nth-child(9) label'
    expect(page).to have_content 'Overridden Label Test Html'
  end

  it 'omits a label if option `label: false` passed although defined in '\
     'translation file as html' do
    render template: 'test_models/labels'

    expect(page).to have_no_css 'form div.form-group:nth-child(10) label'
  end
end
