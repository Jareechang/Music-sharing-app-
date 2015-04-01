// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(function(){
  // handling submits from the search form
  $('#searchbar-submit').on('click', function(e){
    e.preventDefault();
    $searchtext = $('#searchbar-text').val();
    $.getJSON('/tracks', {text: $searchtext}, function(){
      console.log('success');
    })
    .done(function(json){
      console.log(json);
    })
    .fail(function(jqxhr,textstatus, error){

    })
  })
})