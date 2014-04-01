//
//
//= require chosen-jquery
//

var language = window.navigator.userLanguage || window.navigator.language
var result_text;
var placeholder_text;
if((language == "de-DE") || (language == "de")) {
  no_result_text = "Keine Ergebnisse für";
  placeholder_text = "Bitte auswählen";
} else {
  no_result_text = "No results match";
  placeholder_text = "Plase choose";
}


$(document).ready(function() {
  $("select.form-control").chosen({
    no_results_text: no_result_text,
    width: "100%",
    placeholder_text_multiple: placeholder_text,
    placeholder_text_single: placeholder_text,
    search_contains: true
    });
});

