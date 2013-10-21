# B3Form

B3Form is a form builder specifically made for
[Bootstrap 3](http://getbootstrap.com).

**It is in very early stage and by no means ready for production nor complete in
any way.**



# Installation

Add this line to your application's Gemfile:

    gem 'b3form'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install b3form

The Bootstrap 3 stylesheets and JavaScript files are not included in the gem.
B3Form is tested with
[bootstrap-sass](https://github.com/thomas-mcdonald/bootstrap-sass) but should
also work if the stylesheets and JavaScript files are installed through
another gem or manually.



# Usage

B3Form is designed to be used as a form builder in Rails views. It is invoked
using a helper method:

```haml
= b3_form_for @task do |f|
  = f.text_input :title
  = f.submit_button
```

This will generate the markup as described in the Bootstrap 3 documentation:

```html
<form action="..." method="post" role="form">
  <div class="form-group">
    <label for="task_title" class="control-label">Title</label>
    <div>
      <input type="text" class="form-control" name="task[title]">
    </div>
  </div>
  <button type="submit" class="btn btn-default">Create Task</button>
</form>
```

If there are validation errors on the object, B3Form will render the errors
under the input for the field.

To manually render error messages for a field, you can use the
`error_alert :field` helper. This is usually used to render the error messages
for `:base` at the top of the form:

```haml
= b3_form_for @task do |f|
  = f.error_alert :base
```

The error messages are rendered in a red alert box:

```html
<form action="..." method="post" role="form">
  <div class="alert alert-danger">Translation for error message</div>
</form>
```



## Form Layouts

Boostrap 3 supports three different form layouts: basic, horizontal and inline.
B3Form defines three helper methods accordingly:

  * `b3_form_for` (basic layout)
  * `b3_horizontal_form_for`
  * `b3_inline_form_for`

These helpers can be used as a replacement for the standard form builder
invoked with `form_for`.

They can also be used as replacement for `form_tag` without passing an instance
of a model. See the section *Forms without Models* further down.



## Form Elements

B3Form supports many inputs and buttons supported by the standard form builder.
To avoid conflicts, other names are used for the elements. You can call the
methods from the standard form builder (e.g. `f.text_field :description`) if
you want to render "non-bootstrapified" input elements.



### Text-like Inputs

To render a text-like input use the form helper as shown on top of the read me:

```haml
= f.text_input :title
```

This will render:

```html
<div class="form-group">
  <label for="task_title" class="control-label">Title</label>
  <div>
    <input type="text" class="form-control" name="task[title]">
  </div>
</div>
```

Available text-like inputs are:

  * text_input
  * password_input
  * search_input
  * url_input
  * email_input
  * number_input
  * text_area_input



### Checkboxes

Render a single checkbox:

```haml
= f.checkbox_input :done
```

Default style is "stacked", the label is automatically rendered inline (the
form helper for checkboxes also renders a hidden field, this in not shown
below):

```html
<div class="form-group">
  <div>
    <div class="checkbox">
      <label for="task_done">
        <input type="checkbox" name="task[done]">
        Task done?
      </label>
    </div>
  </div>
</div>
```

To render a group of checkboxes and set another layout you can use the
`stacked_checkboxes` and `inline_checkboxes` helpers.

You can also pass a virtual field to the helper which is used as label and
rendered above the checkboxes. The virtual field is translated like a real field
of the object and is used *only* for translation purposes:

```haml
= f.stacked_checkboxes :task_done_states do
  = f.checkbox_input :done
  = f.checkbox_input :really_done

= f.inline_checkboxes :task_done_states do
  = f.checkbox_input :done
  = f.checkbox_input :really_done
```

```html
<div class="form-group">
  <label for="task_done_states">Task done states</label>
  <div>
    <div class="checkbox">
      <label for="task_done">
        <input type="checkbox" name="task[done]">
        Task done?
      </label>
    </div>
  </div>
  <div>
    <div class="checkbox">
      <label for="task_really_done">
        <input type="checkbox" name="task[really_done]">
        Task really done?
      </label>
    </div>
  </div>
</div>

<div class="form-group">
  <label for="task_done_states">Task done states</label>
  <div>
    <label for="task_done" class="checkbox-inline">
      <input type="checkbox" name="task[done]">
      Task done?
    </label>
    <label for="task_really_done" class="checkbox-inline">
      <input type="checkbox" name="task[really_done]">
      Task really done?
    </label>
  </div>
</div>
```

If the virtual field is ommited, the label will not be rendered.



### Radio Buttons

Radio buttons can only rendered inside a `stacked_radios` or `inline_radios`
helper. The field is set in the helper, the value is the first parameter passed
to `radio_value`.

```haml
= f.stacked_radios :priority do
  = f.radio_value :high
  = f.radio_value :low

= f.inline_radios :priority do
  = f.radio_value :high
  = f.radio_value :low
```

```html
<div class="form-group">
  <label for="task_priority">Priority</label>
  <div>
    <div class="radio">
      <label for="task_priority">
        <input type="radio" name="task[priority]" value="high">
        High
      </label>
    </div>
  </div>
  <div>
    <div class="radio">
      <label for="task_priority">
        <input type="radio" name="task[priority]" value="low">
        Low
      </label>
    </div>
  </div>
</div>

<div class="form-group">
  <label for="task_priority">Priority</label>
  <div>
    <label for="task_priority" class="radio-inline">
      <input type="radio" name="task[priority]" value="high">
      High
    </label>
    <label for="task_priority" class="radio-inline">
      <input type="radio" name="task[priority]" value="low">
      Low
    </label>
  </div>
</div>
```

You can also pass a `collection` option if you don't want to render the radio
button values one by one.

The collection option must be:

  * an Array of symbols: `[:value_1, :value_2]`. The entries are used as values
    for the radio buttons. The labels are taken from the translation file (see
    the I18n section below).
  * a Hash of the form: `{ value_1: 'label for value_1', value_2: 'label for
    value_2' }`.
  * a nested Array of the form: `[[:value_1, 'label for value_1'], [:value_2,
    'label for value_2']]`

So to render the same HTML as above, you can do (using an Array and a Hash,
usage of the nested Array is not shown):

```haml
= stacked_radios :priority, collection: [:high, :low]
= inline_radios :priority, collection: { high: 'High', low: 'Low' }
```



### Buttons

Avalable buttons are:

  * submit_button



## I18n

For labeling the different elements B3Form uses the standard I18n system. It
uses the `helpers` section and extends it with it's own attributes. Here are the
translations for a fictional task model (shown as annotated with the 
[Annotate](https://github.com/ctran/annotate_models) gem):

```ruby
# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  done        :boolean
#  really_done :boolean
#  priority    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Task < ActiveRecord::Base  
end
```

```yaml
en:
  helpers:
    labels:
      task:
        title:       Title label
        done_states: Done states label
        done: Done
        really_done: Really Done
        priority:    Priority label
    placeholders:
      task:
        title:       Title Placeholder
    hints:
      task:
        title:       Small hint below the text field
        done_states: Small hint below the checkboxes
        priority:    Small hint below the radio button group
    options:
      task:
        priority:
          high:      High
          low:       Low
```

`done_states` is a virtual attribute to label the two checkboxes which set the
state (*done* and *really_done*). It doesn't have to be an accessible
attribute of the model.



### Labels

Labels are automatically read from `'helpers.labels'` in I18n. To manually set a
label on an element, you can pass a `label`-option:

```haml
= f.text_input :title, label: 'Custom label for title'
```

```html
<div class="form-group">
  <label for="task_title" class="control-label">Custom label for title</label>
  <div>
    <input type="text" class="form-control" name="task[title]">
  </div>
</div>
```

The label option is used as:

  * label for input elements, incl. values of checkboxes and radio buttons
  * caption for buttons (`value` attribute in HTML)

If no label is given (neither by label option or I18n lookup), the label is
ommited or the default label (e.g. the value of a the radio button for radio
button labels) is used.



### Hints

TODO



### Placholders

TODO



### Button captions

TODO



### Error messages

TODO



### Radio button and select options



## General Options

To every input you can pass three options as hashes:

`label_html` sets the HTML attributes of the label tag. The CSS class
*control-label* is mandatory and will be set automatically. You can add
additional classes if you want.

`input_html` sets the HTML attributes of the input tag. The CSS class
*form-control* is mandatory and will be set automatically. You can add
additional classes if you want.

`wrapper_html` sets the HTML attributes of the div wrapped around the label and
the input tag. The CSS class *form-group* is mandatory and will be set
automatically. You can add additional classes if you want.



### Extra options passed to the input

TODO
disabled



## Forms without Models

TODO



# Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
