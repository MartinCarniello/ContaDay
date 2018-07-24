// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery-3.3.1.min
//= require popper.min
//= require bootstrap.min
//= require bootstrap-datepicker.min
//= require jquery.minicolors
//= require inputmask.min
//= require inputmask.numeric.extensions.min
//= require Chart.min
//= require jquery-ui.min
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {
	setTimeout(function(){
	  $('.alert-message').slideUp();
	}, 5000);
});