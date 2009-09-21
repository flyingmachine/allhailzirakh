NewVerbForm = $.klass(Remote.Form, {
	initialize: function($super, options) {		
		this.submit_button = $("input[type=submit]", this.element);
		this.submit_text = this.submit_button.text();
		
    this.spinner = $(".spinner", this.element);
		$super();
	},
	
	beforeSend: function() {
	  this.spinner.show();
		this.disable();
	},
	
	complete: function() {
    this.spinner.hide();
		this.enable();
	},
	
	success: function(response, result) {
    this.enable()
    this.spinner.hide();
    $("#verb_command")[0].focus()
	},
	
	error: function(request, textStatus, erorThrown) {
	  $("#facebox #new-form").replaceWith(request.responseText)
	},
	
	disable: function() {
		this.submit_button.attr('disabled', 'disabled').val('Saving');
	},
	
	enable: function() {
    this.submit_button.attr('disabled', false).val('Create');
	}
});

$(function(){
  $("#new_verb").attach(NewVerbForm)
})