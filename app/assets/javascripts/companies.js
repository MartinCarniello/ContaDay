$( document ).on('turbolinks:load', function() {
  new Inputmask("9{1,},{0,1}9{1,}").mask("#general_expense_cost");
	
	$("#general_expense_date_time").datepicker({
		format: 'dd/mm/yyyy',
    autoclose: true
	}).datepicker("setDate",'now');

	$('.js-company-user-color').minicolors();
})