
$(document).ready(function(){
  
  $('#copy_address').click(function(event){
    event.preventDefault();
    $('#correspond_company_name').val($('#company_full_name').val());
    $('#correspond_street').val($('#invoice_street').val());
    $('#correspond_street_no').val($('#invoice_street_no').val());
    $('#correspond_postal_code').val($('#invoice_postal_code').val());
    $('#correspond_city').val($('#invoice_city').val());
  });

  $('form').on("click",".remove_fields",function(event){
    $(this).prev('input[type=hidden]').val(1);
    $(this).closest('fieldset').hide();
    event.preventDefault();
  });

  $('form').on("click",".add_fields",function(event){
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp,time));
    event.preventDefault();
  });
})