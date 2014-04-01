require 'spec_helper'

describe 'submit button' do
  let(:test_model) { TestModel.new }
  before           { assign :test_model, test_model }

# View
# --------
# = f.submit_button
# = f.submit_button 'Overridden Button'
#
# de.yml
# --------
# helpers:
#   submit:
#     test_model:
#       create: Submit TestModel (create)
#
# HTML
# --------
# <button type="submit" class="btn btn-default">Submit TestModel (create)</button>
# <button type="submit" class="btn btn-default">Overridden Button Text</button>

  it 'renders a submit button with class="btn btn-default"' do
    html = render template: 'test_models/submit_button'

    expect(page(html)).to have_css 'form button[type=submit]'
  end

  it 'uses the translations from the translation file' do
    html = render template: 'test_models/submit_button'

    expect(page(html)).to have_content 'Submit TestModel (create)'
  end

  it 'uses the passed label although a translation is given in the translation' \
     'file' do
    html = render template: 'test_models/submit_button'

    expect(page(html)).to have_content 'Overridden Button Text'
  end
end
