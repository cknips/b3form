require 'spec_helper'


describe 'html options' do
  let(:test_model) { TestModel.new }
  before           { assign :test_model, test_model }  


  describe 'label_html' do

# View:
#
# = f.text_input :title, label_html: { id: 'label_id' }
#
# HTML:
#
# <div class="form-group">
#   <label for="test_model_title" class="control-label">Text</label>
#   <div>
#     <input type="text" class="form-control" name="test_model_title" placeholder="text">
#   </div>
# </div>

    it 'passes through attributes for the label tag, preserves given classes' do
      render template: 'test_models/html_options'

      expect(page).to have_css 'form label[for=test_model_email]'
      expect(page).to have_css 'form label#label_id'
      expect(page).to have_css 'form label.col-lg-2.control-label'
    end
  end


  describe 'input_html' do

# View:
#
# <%= f.text_input :title, input_html: { placeholder: 'text', class: 'input-lg' }
#
# HTML:
#
# <div class="form-group">
#   <label for="test_model_title" class="control-label">Text</label>
#   <div>
#     <input type="text" class="form-control input-lg" name="test_model_title" placeholder="text">
#   </div>
# </div>

    it 'passes through attributes for the input tag, preserves given classes' do
      render template: 'test_models/html_options'

      expect(page).to have_css 'form input[type=text]'
      expect(page).to have_css 'form input.input-lg.form-control'
      expect(page).to have_css 'form input[placeholder=text]'
    end
  end


  describe 'wrapper_html' do

# View:
#
# <%= f.text_input :title, wrapper_html: { id: 'wrapper_id', class: 'has-success' }
#
# HTML:
#
# <div class="form-group" id="wrapper_id">
#   <label for="test_model_title" class="control-label">Text</label>
#   <div>
#     <input type="text" class="form-control" name="test_model_title" placeholder="text">
#   </div>
# </div>

    it 'passes through attributes for the wrapper div tag, preserves given classes' do
      render template: 'test_models/html_options'

      expect(page).to have_css 'form div.form-group.has-success'
      expect(page).to have_css 'form div.form-group#wrapper_id'
    end
  end
end
