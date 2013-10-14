# B3Form

B3Form is a form builder specifically made for
[Bootstrap 3](http://getbootstrap.com).

**It is in very early stage and by no means ready for production nor complete in
any way.**



## Installation

Add this line to your application's Gemfile:

    gem 'b3form'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install b3form

The Bootstrap 3 stylesheets and JavaScript files are not included in the gem. B3Form is tested with
[bootstrap-sass](https://github.com/thomas-mcdonald/bootstrap-sass) but should
also work if the stylesheets and JavaScript files are installed through
another gem or manually.



## Usage

B3Form is designed to be used as a form builder in Rails views. It is invoked
using a helper method:

```erb
<%= b3_form_for @task do |f| %>
  <%= f.text_input :description %>
  <%= f.submit_button %>
<% end %>
```

This will generate the markup as described in the Bootstrap 3 documentation:

```html
<form action="..." method="post" role="form">
  <div class="form-group">
    <label for="task_title" class="control-label">Description</label>
    <input type="text" class="form-control" name="task_description">
  </div>
  <button type="submit" class="btn btn-default">Create Task</button>
</form>
```

If there are validation errors on the object, B3Form will render the errors
under the input for the field.

To manually render error messages for a field, you can use the
`error_alert :field` helper. This is usually used to render the error messages
for `:base` at the top of the form:

```erb
<%= b3_form_for @task do |f| %>
  <%= f.error_alert :base %>
<% end %>
```

The error messages are rendered in a red alert box:

```html
<form action="..." method="post" role="form">
  <div class="alert alert-danger">Translation for error message</div>
</form>
```



### Form Layouts

Boostrap 3 supports three different form layouts: basic, horizontal and inline.
B3Form defines three helper methods accordingly:

  * `b3_form_for` (basic layout)
  * `b3_horizontal_form_for`
  * `b3_inline_form_for`

These helpers can be used as a replacement for the standard form builder
invoked with `form_for`.

They can also be used as replacement for `form_tag` without passing an instance
of a model. See the section *Forms without Models* further down.



### Available Inputs and Buttons

B3Form supports all the inputs and buttons supported by the standard form
builder. To avoid conflicts, other names are used for the elements. You can call
the methods from the standard form builder (like `f.text_field :description`) if
you want to render "non-bootstrapified" input elements.

Available inputs are:

  * text_input

Avalable buttons are:

  * submit_button


### General Options

To every input you can pass three options as hashes:

`label_html` sets the HTML attributes of the label tag. The CSS class
*control-label* is mandatory and will be set automatically. You can add
additional classes if you want.

`input_html` sets the HTML attributes of the input tag. The CSS class
*form-control* is mandatory and will be set automatically. You can add
additional classes if you want.

`wrapper_html` sets the HTML attributes of the div wrapped around the label and
the input tag. The CSS class *form-group* is mandatory and will be set automatically. You can add additional classes if you want.



### I18n

Labels, Hints, Placeholders, Button Texts, Error Messages
TODO I18n
TODO pass option to input




### Forms without Models

TODO



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
