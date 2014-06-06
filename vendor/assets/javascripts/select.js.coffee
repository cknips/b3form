class B3Form.Select
  @init: ->
    @setLanguage()

    for selectField in $("select.form-control")
      searchThreshold = $(selectField).data("search-threshold") or 10

      $(selectField).chosen
        no_results_text:           @noResultText
        width:                     "100%"
        placeholder_text_multiple: @placeholderText
        placeholder_text_single:   @placeholderText
        search_contains:           true
        disable_search_threshold:  searchThreshold


  @setLanguage: ->
    language = window.navigator.userLanguage or window.navigator.language

    if language.match(/de-?.*/)
      @noResultText    = "Keine Ergebnisse für"
      @placeholderText = "Bitte auswählen"
    else
      @noResultText    = "No results match"
      @placeholderText = "Please choose"


$ ->
  B3Form.Select.init()
  $(document).on "page:load", -> B3Form.Select.init()
