require 'spec_helper'

describe 'Hints' do
  let(:test_model) { TestModel.new }
  before           { assign :test_model, test_model }

# View:
# --------
# = f.text_input :hint_test_omitted
# = f.text_input :hint_test
# = f.text_input :hint_test_html
# = f.text_input :hint_test_omitted, hint: 'Overridden Title'
# = f.text_input :hint_test, hint: 'Overridden Hint Test'
# = f.text_input :hint_test_html, hint: 'Overridden Hint Test Html'
#
# de.yml:
# --------
# helpers:
#   hint:
#     test_model:
#       hint_test: Hint Test Description
#       hint_test_html: Hint Test <b>Description</b>
#
# HTML:
# --------
# <div class="form-group">
#   <label for="test_model_hint_test_omitted" class="control-label">Text</label>
#   <div>
#     <input type="text" class="form-control" name="test_model_hint_test_omitted">
#   </div>
# </div>
# <div class="form-group">
#   <label for="test_model_hint_test" class="control-label">Text</label>
#   <div>
#     <input type="text" class="form-control" name="test_model_hint_test">
#   </div>
#   <div class="hint">Hint Test Description</div>
# </div>
# <div class="form-group">
#   <label for="test_model_hint_test_html" class="control-label">Text</label>
#   <div>
#     <input type="text" class="form-control" name="test_model_hint_test_html">
#   </div>
#   <div class="hint">Hint Test <b>Description</b></div>
# </div>
# <div class="form-group">
#   <label for="test_model_hint_test_omitted" class="control-label">Text</label>
#   <div>
#     <input type="text" class="form-control" name="test_model_hint_test_omitted">
#   </div>
#   <div class="hint">Overridden hint_test_omitted</div>
# </div>
# <div class="form-group">
#   <label for="test_model_hint_test" class="control-label">Text</label>
#   <div>
#     <input type="text" class="form-control" name="test_model_hint_test">
#   </div>
#   <div class="hint">Overridden Hint Test</div>
# </div>
# <div class="form-group">
#   <label for="test_model_hint_test_html" class="control-label">Text</label>
#   <div>
#     <input type="text" class="form-control" name="test_model_hint_test_html">
#   </div>
#   <div class="hint">Overridden Hint Test Html</div>
# </div>

  it 'does not show a hint if none is defined in translation file or passed' \
     'as option' do
    render template: 'test_models/hints'

    expect(page).to have_no_css 'form div.form-group:nth-child(2) div.hint'
  end

  it 'shows a hint if defined in translation file' do
    render template: 'test_models/hints'

    expect(page).to have_css 'form div.form-group:nth-child(3) div.hint'
    expect(page).to have_content 'Hint Test Description'
  end

  it 'shows a hint as html if defined in translation file' do
    render template: 'test_models/hints'

    expect(page).to have_css 'form div.form-group:nth-child(4) div.hint'
    expect(page).to have_css 'form div.form-group:nth-child(4) div.hint b'
  end

  it 'shows a hint if passed as option' do
    render template: 'test_models/hints'

    expect(page).to have_css 'form div.form-group:nth-child(5) div.hint'
    expect(page).to have_content 'Overridden Omitted'
  end

  it 'shows the hint passed as option even if another hint is defined in the '\
     'translation file' do
    render template: 'test_models/hints'

    expect(page).to have_css 'form div.form-group:nth-child(6) div.hint'
    expect(page).to have_content 'Overridden Hint Test'
  end

  it 'shows the hint passed as option even if another hint is defined as '\
     'html in the translation file' do
    render template: 'test_models/hints'

    expect(page).to have_css 'form div.form-group:nth-child(7) div.hint'
    expect(page).to have_content 'Overridden Hint Test Html'
  end
end
