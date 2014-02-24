
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

  $('#copy_address_from_chain').click(function(event){
    event.preventDefault();
    var id = $('#sell_point_chain_id option:selected').val();
    if(id) {
      $.ajax({
        type: 'GET',
        url: "/sell_points/"+id+".json",
        dataType: 'json',
        success: function(data){
          setAddresses(data);
        }
      });
    }
  });

  function setAddresses(data) {
    $('#correspond_company_name').val(data.addresses.correspond.company_name);
    $('#correspond_street').val(data.addresses.correspond.street);
    $('#correspond_street_no').val(data.addresses.correspond.street_no);
    $('#correspond_postal_code').val(data.addresses.correspond.postal_code);
    $('#correspond_city').val(data.addresses.correspond.city);
    $('#company_full_name').val(data.addresses.invoice.company_name);
    $('#invoice_street').val(data.addresses.invoice.street);
    $('#invoice_street_no').val(data.addresses.invoice.street_no);
    $('#invoice_postal_code').val(data.addresses.invoice.postal_code);
    $('#invoice_city').val(data.addresses.invoice.city);
    $('#invoice_nip').val(data.addresses.invoice.nip);
  }

})