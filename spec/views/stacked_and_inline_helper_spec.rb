require 'spec_helper'

describe 'stacked_and_inline_helper' do
  let(:test_model) { TestModel.new }
  before           { assign :test_model, test_model }

# View
#
# = f.stacked_checkboxes do
#   = f.checkbox_input :done
#   = f.checkbox_input :really_done
#
# = f.inline_checkboxes do
#   = f.checkbox_input :done
#   = f.checkbox_input :really_done
#
# HTML
#
# <div class="form-group">
#   <label for="task_done_states">Task done states</label>
#   <div>
#     <div class="checkbox">
#       <label for="task_done">
#         <input type="checkbox" name="task_done">
#         Task done?
#       </label>
#     </div>
#   </div>
#   <div>
#     <div class="checkbox">
#       <label for="task_really_done">
#         <input type="checkbox" name="task_really_done">
#         Task really done?
#       </label>
#     </div>
#   </div>
# </div>
#
# <div class="form-group">
#   <label for="task_done_states">Task done states</label>
#   <div>
#     <label for="task_done" class="checkbox-inline">
#       <input type="checkbox" name="task_done">
#       Task done?
#     </label>
#     <label for="task_really_done" class="checkbox-inline">
#       <input type="checkbox" name="task_really_done">
#       Task really done?
#     </label>
#   </div>
# </div>

  it 'renders the checkboxes stacked' do
    render template: 'test_models/stacked_and_inline_helper'

    expect(page).to have_css 'form#stacked div.form-group label'

    expect(page).to have_css 'form#stacked div.form-group div div.checkbox label'
    expect(page).to have_css 'form#stacked div.form-group div div.checkbox label input[type=checkbox]'
  end

  it 'renders the checkboxes inline' do
    render template: 'test_models/stacked_and_inline_helper'

    expect(page).to have_css 'form#inline div.form-group label'

    expect(page).to have_css 'form#inline div.form-group div label.checkbox-inline'
    expect(page).to have_css 'form#inline div.form-group div label.checkbox-inline input[type=checkbox]'
  end
end
