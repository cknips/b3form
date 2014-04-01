require 'spec_helper'

describe 'form_elements' do
  let(:test_model) { TestModel.new }
  before           { assign :test_model, test_model }

# View:
#
# = f.text_input      :email, wrapper_html: { id: 'text' }
# = f.password_input  :email, wrapper_html: { id: 'password' }
# = f.search_input    :email, wrapper_html: { id: 'search' }
# = f.url_input       :email, wrapper_html: { id: 'url' }
# = f.email_input     :email, wrapper_html: { id: 'email' }
# = f.number_input    :email, wrapper_html: { id: 'number' }
# = f.checkbox_input  :email, wrapper_html: { id: 'checkbox' }
# = f.text_area_input :email, wrapper_html: { id: 'text-area' }
#
# HTML:
#
# <div class="form-group" id="text">
#   <label for="test_model_email" class="control-label">Text</label>
#     <input type="text" class="form-control" name="test_model_email">
# </div>
# <div class="form-group" id="password">
#   <label for="test_model_email" class="control-label">Text</label>
#     <input type="password" class="form-control" name="test_model_email">
# </div>
# <div class="form-group" id="search">
#   <label for="test_model_email" class="control-label">Text</label>
#     <input type="search" class="form-control" name="test_model_email">
# </div>
# <div class="form-group" id="url">
#   <label for="test_model_email" class="control-label">Text</label>
#     <input type="url" class="form-control" name="test_model_email">
# </div>
# <div class="form-group" id="email">
#   <label for="test_model_email" class="control-label">Text</label>
#     <input type="email" class="form-control" name="test_model_email">
# </div>
# <div class="form-group" id="number">
#   <label for="test_model_email" class="control-label">Text</label>
#     <input type="number" class="form-control" name="test_model_email">
# </div>
# <div class="form-group" id="checkbox">
#     <div class="checkbox">
#       <label for="test_model_email">
#         <input type="checkbox" name="test_model_email">
#         Text
#       </label>
#     </div>
# </div>
# <div class="form-group" id="number">
#   <label for="test_model_email" class="control-label">Text</label>
#     <textarea class="form-control" name="test_model_email">
# </div>

  shared_examples_for 'a text style input' do
    it 'renders an input field with class="form-control" and a label with '\
       'class="control-label", wrapped in a div with class="form-group"' do
      html = render template: 'test_models/form_elements'

      expect(page(html)).to have_css "form div.form-group##{input_type} label[for=test_model_email]"
      expect(page(html)).to have_css "form div.form-group##{input_type} label.control-label"

      expect(page(html)).to have_css "form div.form-group##{input_type} input[type=#{input_type}]"
      expect(page(html)).to have_css "form div.form-group##{input_type} input.form-control"
    end
  end


  describe 'text_input' do
    let(:input_type) { 'text' }

    it_behaves_like 'a text style input'
  end

  describe 'password_input' do
    let(:input_type) { 'password' }

    it_behaves_like 'a text style input'
  end

  describe 'search_input' do
    let(:input_type) { 'search' }

    it_behaves_like 'a text style input'
  end

  describe 'url_input' do
    let(:input_type) { 'url' }

    it_behaves_like 'a text style input'
  end

  describe 'email_input' do
    let(:input_type) { 'email' }

    it_behaves_like 'a text style input'
  end

  describe 'number_input' do
    let(:input_type) { 'number' }

    it_behaves_like 'a text style input'
  end

  
  describe 'checkbox_input' do
    it 'renders a checkbox field inside a label, wrapped in a div with '\
       'class="checkbox"' do
      html = render template: 'test_models/form_elements'

      expect(page(html)).to have_css "form div.form-group#checkbox div.checkbox label[for=test_model_email]"
      expect(page(html)).to have_css "form div.form-group#checkbox div.checkbox label[for=test_model_email] input[type=checkbox]"
    end
  end


  describe 'text area input' do
    it 'renders a text area with class="form-control" and a label with '\
       'class="control-label", wrapped in a div with class="form-group"' do
      html = render template: 'test_models/form_elements'

      expect(page(html)).to have_css "form div.form-group#text-area label[for=test_model_email]"
      expect(page(html)).to have_css "form div.form-group#text-area label.control-label"

      expect(page(html)).to have_css "form div.form-group#text-area textarea"
      expect(page(html)).to have_css "form div.form-group#text-area textarea.form-control"
    end
  end
end
