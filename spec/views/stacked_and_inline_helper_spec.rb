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
#         <input type="checkbox" name="task[done]">
#         Task done?
#       </label>
#     </div>
#   </div>
#   <div>
#     <div class="checkbox">
#       <label for="task_really_done">
#         <input type="checkbox" name="task[really_done]">
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
#       <input type="checkbox" name="task[done]">
#       Task done?
#     </label>
#     <label for="task_really_done" class="checkbox-inline">
#       <input type="checkbox" name="task[really_done]">
#       Task really done?
#     </label>
#   </div>
# </div>

  it 'renders the checkboxes stacked' do
    render template: 'test_models/stacked_and_inline_helper'

    expect(page).to have_css 'form#stacked-checkboxes div.form-group label'

    expect(page).to have_css 'form#stacked-checkboxes div.form-group div div.checkbox label'
    expect(page).to have_css 'form#stacked-checkboxes div.form-group div div.checkbox label input[type=checkbox]'
  end

  it 'renders the checkboxes inline' do
    render template: 'test_models/stacked_and_inline_helper'

    expect(page).to have_css 'form#inline-checkboxes div.form-group label'

    expect(page).to have_css 'form#inline-checkboxes div.form-group div label.checkbox-inline'
    expect(page).to have_css 'form#inline-checkboxes div.form-group div label.checkbox-inline input[type=checkbox]'
  end


# View
#
# = f.stacked_radios :priority do
#   = f.radio_value :high
#   = f.radio_value :low
#
# = f.inline_radios :priority do
#   = f.radio_value :high
#   = f.radio_value :low
#
# HTML
#
# <div class="form-group">
#   <label for="task_priority">Priority</label>
#   <div>
#     <div class="radio">
#       <label for="task_priority">
#         <input type="radio" name="task[priority]" value="high">
#         High
#       </label>
#     </div>
#   </div>
#   <div>
#     <div class="radio">
#       <label for="task_priority">
#         <input type="radio" name="task[priority]" value="low">
#         Low
#       </label>
#     </div>
#   </div>
# </div>
#
# <div class="form-group">
#   <label for="task_priority">Priority</label>
#   <div>
#     <label for="task_priority" class="radio-inline">
#       <input type="radio" name="task[priority]" value="high">
#       High
#     </label>
#     <label for="task_priority" class="radio-inline">
#       <input type="radio" name="task[priority]" value="low">
#       Low
#     </label>
#   </div>
# </div>

  it 'renders the radios stacked' do
    render template: 'test_models/stacked_and_inline_helper'

    expect(page).to have_css 'form#stacked-radios div.form-group label'

    expect(page).to have_css 'form#stacked-radios div.form-group div div.radio label'
    expect(page).to have_css 'form#stacked-radios div.form-group div div.radio label input[type=radio][value=low]'
    expect(page).to have_css 'form#stacked-radios div.form-group div div.radio label input[type=radio][value=high]'
  end

  it 'renders the radios inline' do
    render template: 'test_models/stacked_and_inline_helper'

    expect(page).to have_css 'form#inline-radios div.form-group label'

    expect(page).to have_css 'form#inline-radios div.form-group div label.radio-inline'
    expect(page).to have_css 'form#inline-radios div.form-group div label.radio-inline input[type=radio][value=low]'
    expect(page).to have_css 'form#inline-radios div.form-group div label.radio-inline input[type=radio][value=high]'
  end
end
