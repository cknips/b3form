require 'spec_helper'

describe 'error features' do
  let(:test_model) { TestModel.new }
  before           { assign :test_model, test_model }
  let(:html)       { render template: 'test_models/error' }

# View:
#
# = b3_form_for @test_model do |f|
#   = f.error_alert :base
#   = f.text_input :email
#
# with @test_model.email having a validation error and an error in :base
#
# HTML:
#
# <form action="..." role="form">
#   <div class="alert alert-danger">Translation for generic error</div>
#   <div class="form-group has-error">
#     <label for="test_model_title" class="control-label">Text</label>
#     <input type="text" class="form-control" name="test_model_title">
#     <div class="help-block">Error message</div>
#   </div>
# </form>

  describe 'error class' do
    before do
      test_model.errors.add :email, :blank
      test_model.errors.add :base,  :generic_error
    end

    it 'adds has-error class to form-group if object has an error on the field '\
       'and puts error message under input tag' do
      expect(page(html)).to have_css 'form div.form-group.has-error'
      expect(page(html)).to have_css 'form div.help-block'
    end

    it 'renderes the error messages for :base at the top of the form' do
      expect(page(html)).to have_css 'form div.alert.alert-danger'
      expect(page(html)).to have_content 'Translation for generic error'
    end

    it 'omits the field_with_errors div rendered by the rails by default' do
      expect(page(html)).to have_no_css 'form div.field_with_errors'
    end
  end
end
