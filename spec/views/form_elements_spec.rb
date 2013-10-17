require 'spec_helper'

describe 'form_elements' do
  let(:test_model) { TestModel.new }
  before           { assign :test_model, test_model }

# View:
#
# <%= f.text_input     :email, wrapper_html: { id: 'text' } %>
# <%= f.password_input :email, wrapper_html: { id: 'password' } %>
# <%= f.search_input   :email, wrapper_html: { id: 'search' } %>
# <%= f.url_input      :email, wrapper_html: { id: 'url' } %>
# <%= f.email_input    :email, wrapper_html: { id: 'email' } %>
# <%= f.number_input   :email, wrapper_html: { id: 'number' } %>
#
# HTML:
#
# <div class="form-group" id="text">
#   <label for="test_model_title" class="control-label">Text</label>
#   <input type="text" class="form-control" name="test_model_title">
# </div>
# <div class="form-group" id="password">
#   <label for="test_model_title" class="control-label">Text</label>
#   <input type="password" class="form-control" name="test_model_title">
# </div>
# <div class="form-group" id="search">
#   <label for="test_model_title" class="control-label">Text</label>
#   <input type="search" class="form-control" name="test_model_title">
# </div>
# <div class="form-group" id="url">
#   <label for="test_model_title" class="control-label">Text</label>
#   <input type="url" class="form-control" name="test_model_title">
# </div>
# <div class="form-group" id="email">
#   <label for="test_model_title" class="control-label">Text</label>
#   <input type="email" class="form-control" name="test_model_title">
# </div>
# <div class="form-group" id="number">
#   <label for="test_model_title" class="control-label">Text</label>
#   <input type="number" class="form-control" name="test_model_title">
# </div>

  shared_examples_for 'a text style input' do
    it 'renders an input field with class="form-control" and a label with '\
     'class="control-label", wrapped in a div with class="form-group"' do
      render template: 'test_models/form_elements'

      expect(page).to have_css "form div.form-group##{input_type} label[for=test_model_email]"
      expect(page).to have_css "form div.form-group##{input_type} label.control-label"

      expect(page).to have_css "form div.form-group##{input_type} input[type=#{input_type}]"
      expect(page).to have_css "form div.form-group##{input_type} input.form-control"
    end
  end


  describe 'text_field' do
    let(:input_type) { 'text' }

    it_behaves_like 'a text style input'
  end

  describe 'password_field' do
    let(:input_type) { 'password' }

    it_behaves_like 'a text style input'
  end

  describe 'search_field' do
    let(:input_type) { 'search' }

    it_behaves_like 'a text style input'
  end

  describe 'url_field' do
    let(:input_type) { 'url' }

    it_behaves_like 'a text style input'
  end

  describe 'email_field' do
    let(:input_type) { 'email' }

    it_behaves_like 'a text style input'
  end

  describe 'number_field' do
    let(:input_type) { 'number' }

    it_behaves_like 'a text style input'
  end
end
