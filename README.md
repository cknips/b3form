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
[bootstrap-sass](https://github.com/thomas-mcdonald/bootstrap-sass) and makes
use of the Sass variables in the gem.

Then import the stylesheets in your application's stylesheet manifest:

```scss
@import 'b3form';
```

Make sure the `b3form` import is below the `bootstrap` import from
bootstrap-sass.



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
    <input type="text" class="form-control" name="task[title]">
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



### Basic Forms

The basic form renders all parts of an input (label, input field, hint and
errors) stacked. The input are always set to 100% width as described in the
Bootstrap 3 documentation.

The basic form can also be used for rendering multiple column forms using the
grid system provided by bootstrap:

```haml
.container
  = b3_form_for @task do |f|
    .row
      .col-md-6
        = f.text_input :title
      .col-md-6
        = f.text_input :description
    .row
      ...

```



### Horizontal Forms

In a horizontal form a width can be assigned to the parts of an input. If the
width is ommited the part is rendered above (labels) or below (hints and error
messages) the input field. Setting the width of the input field is mandatory.

The width settings can be passed as hash to the form builder:

```haml
= b3_horizontal_form_for columns: { label: 'col-md-2',
                                    input: 'col-md-4',
                                    hint:  'col-md-4' } do |f|
  = f.text_field :title
```

This will render label, input field and hint side by side. The error messages
are rendered below the input field since they have no width assigned. To assign
a width to the error messages, use the `:error` key in the columns hash.

If you don't want to pass a large hash to the form builder, you can also use the
`set_column` helper method of the form builder:

```haml
= b3_horizontal_form_for do |f|
  - set_column :label, 'col-md-2'
  - set_column :input, 'col-md-4'
  - set_column :hint,  'col-md-4'
  = f.text_field :title
```

This will render the same as above. The `set_column` helper can also used to
change the width settings in between the form elements.



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
  <input type="text" class="form-control" name="task[title]">
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
  <div class="checkbox">
    <label for="task_done">
      <input type="checkbox" name="task[done]">
      Task done?
    </label>
  </div>
</div>
```

To render a group of checkboxes and set another layout you can use the
`checkbox_group` helper. The layout ist set with the `:layout` option, possible
values are `:stacked` and `:inline`. If the option is ommited, the default
layout for the form is used which is *stacked* for basic and horizontal forms
and *inline* for inline forms.

You can also pass a virtual field to the helper which is used as label and
rendered above the checkboxes. The virtual field is translated like a real field
of the object and is used for translation purposes. To render the errors for the
field it must be defined as accessible attribute in the model. If you don't
want to add errors to the virtual field, it does not have to be accessible.

```haml
= f.checkbox_group :task_done_states, layout: :stacked do
  = f.checkbox_input :done
  = f.checkbox_input :really_done

= f.checkbox_group :task_done_states, layout: :inline do
  = f.checkbox_input :done
  = f.checkbox_input :really_done
```

```html
<div class="form-group">
  <label for="task_done_states">Task done states</label>
  <div class="checkbox">
    <label for="task_done">
      <input type="checkbox" name="task[done]">
      Task done?
    </label>
  </div>
  <div class="checkbox">
    <label for="task_really_done">
      <input type="checkbox" name="task[really_done]">
      Task really done?
    </label>
  </div>
</div>

<div class="form-group">
  <label for="task_done_states">Task done states</label>
  <label for="task_done" class="checkbox-inline">
    <input type="checkbox" name="task[done]">
    Task done?
  </label>
  <label for="task_really_done" class="checkbox-inline">
    <input type="checkbox" name="task[really_done]">
    Task really done?
  </label>
</div>
```

If the virtual field is ommited, the label will not be rendered.



### Radio Buttons

Radio buttons can only rendered inside a `radio_group` helper. The field is set
in the helper, the value is the first parameter passed to `radio_option`.

The layout of the group is set equivalent to the `checkbox_group`.

```haml
= f.radio_group :priority, layout: :stacked do
  = f.radio_option :high
  = f.radio_option :low

= f.radio_group :priority, layout: :inline do
  = f.radio_option :high
  = f.radio_option :low
```

```html
<div class="form-group">
  <label for="task_priority">Priority</label>
  <div class="radio">
    <label for="task_priority">
      <input type="radio" name="task[priority]" value="high">
      High
    </label>
  </div>
  <div class="radio">
    <label for="task_priority">
      <input type="radio" name="task[priority]" value="low">
      Low
    </label>
  </div>
</div>

<div class="form-group">
  <label for="task_priority">Priority</label>
  <label for="task_priority" class="radio-inline">
    <input type="radio" name="task[priority]" value="high">
    High
  </label>
  <label for="task_priority" class="radio-inline">
    <input type="radio" name="task[priority]" value="low">
    Low
  </label>
</div>
```

If you don't want to render the radio button values one by one, you can use the
`radio_options` helper which takes an Enumerable. The first param of the helper
(the enumerable) must be:

  * an Array of symbols: `[:value_1, :value_2]`. The entries are used as values
    for the radio buttons. The labels are taken from the translation file (see
    the I18n section below).
  * a Hash of the form: `{ value_1: 'label for value_1', value_2: 'label for
    value_2' }`.
  * a nested Array of the form: `[[:value_1, 'label for value_1'], [:value_2,
    'label for value_2']]`

So to render the same HTML as above, you can do (showing the usage of an Array
and a Hash, usage of the nested Array is not shown):

```haml
= radio_group :priority, layout: :stacked do
  = radio_options [:high, :low]
= radios_group :priority, layout: :inline do
  = radio_options({ high: 'High', low: 'Low' })
```

`radio_option` and `radio_options` can be used together in one block in any
combination.



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
    label:
      task:
        title:       Title label
        done_states: Done states label
        done:        Done
        really_done: Really Done
        priority:    Priority label
    placeholder:
      task:
        title:       Title Placeholder
    hint:
      task:
        title:       Small hint below the text field
        done_states: Small hint below the checkboxes
        priority:    Small hint below the radio button group
    option:
      task:
        priority:
          high:      High
          low:       Low
```

`done_states` is a virtual attribute to label the two checkboxes which set the
state (*done* and *really_done*). It doesn't have to be an accessible
attribute of the model.

You can also use HTML translations:

```yaml
en:
  helpers:
    label:
      task:
        really_done: '<i>Really</i> Done'
```

To define default translations for input parts there is also the reserved key
`default` you can use instead of the model name:

```yaml
en:
  helpers:
    label:
      default:
        title: Title
```

As expected, setting a key specific for a model name, the default will be
overridden. To unset a default for a field without overiding ist with another
value (e.g. because you want to omit a label for a specific field where a
default translation is already set) use `false` as translation.



### Labels

Labels are automatically read from `'helpers.label'` in I18n. To manually set a
label on an element, you can pass a `:label` option:

```haml
= f.text_input :title, label: 'Custom label for title'
```

```html
<div class="form-group">
  <label for="task_title" class="control-label">Custom label for title</label>
  <input type="text" class="form-control" name="task[title]">
</div>
```

The label option is used as:

  - label for input elements, incl. values of checkboxes and radio buttons
  - caption for buttons (`value` attribute in HTML)

If no label is given (neither by label option or I18n lookup), the label is
ommited.



### Hints

TODO



### Placholders

TODO



### Button captions

TODO



### Error messages

TODO



### Radio button and select options

TODO



### Required text(-like) fields

To mark an input as required pass `required: true` as option:

```haml
= f.text_field :price, required: true
```

This modifies the label of the input. By default it adds a star:

```html
<div class="form-group">
  <label for="task_title" class="control-label">Title*</label>
  <input type="text" class="form-control" name="task[title]">
</div>
```

The mark and layout can be set by I18n. The following example uses a paragraph
sign (&para;) as mark and renders it italic:

```yaml
en:
  b3form:
    required_input_label: '%{label} <i>&para;</i>'
```

```html
<div class="form-group">
  <label for="task_title" class="control-label">Title <i>&para;</i></label>
  <input type="text" class="form-control" name="task[title]">
</div>
```

You can set the mark freely, the field does not have to have a validation for
presence in the model. You can also leave out the mark for fields that are
actually required if you tell it the user another way -- or don't tell them at
all if you reach for bad user experience. :stuck_out_tongue:



## General Options

To every input you can pass three options as hashes:

`label_html` sets the HTML attributes of the label tag. The CSS class
`control-label` is mandatory and will be set automatically. You can add
additional classes if you want.

`input_html` sets the HTML attributes of the input tag. The CSS class
`form-control` is mandatory and will be set automatically. You can add
additional classes if you want.

`button_html` sets the HTML attributes of the button tag. The CSS class
`btn` is mandatory and will be set automatically. If you don't set a button
class, `btn-default` will be set. You can add additional classes if you want.

`wrapper_html` sets the HTML attributes of the div wrapped around the label and
the input tag. The CSS class `form-group` is mandatory and will be set
automatically. You can add additional classes if you want.



### Extra options passed to input fields and buttons

The following options are directly passed to the input field, so you don't have
to use `:input_html` to set them:

  - `:id`
  - `:disabled` taking a boolean value
  - `:size` taking `'input-sm'` or `'input-lg'` for input fields and `'btn-xs'`,
    `'btn-sm'` and `'btn-lg'` for buttons



### Input Groups

To render a Bootstrap 3 input group, you can use the `:prepend` and `:append`
options:

```haml
= f.text_field :price, prepend: '$', append: '.00'
```

```html
<div class="form-group">
  <label for="product_price" class="control-label">Price</label>
  <div class="input-group">
    <span class="input-group-addon">$</span>
    <input type="text" class="form-control" name="product[price]">
    <span class="input-group-addon">.00</span>
  </div>
</div>
```

`:prepend` and `:append` can be used together with the `glyphicon` helper to
render a glyphicon before or after the input field.



## Forms without Models

TODO



## Helper Methods

### Glyphicons

Use the `glyphicon` helper to render a glyphicon. The list of available icons
can be found in the [Bootstrap Documentation](http://getbootstrap.com/components/#glyphicons).

```haml
= glyphicon('search')
```

```html
<span class="glyphicon glyphicon-search"></span>
```



# Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
