$(document).ready(function() {
  
  var selectedOfferId = $('#sell_point_offer_offer_id').val();
  
  getOfferJson(selectedOfferId, function(result){
    $('#sell_point_offer_price').val(result.price);
  });


  $('#sell_point_offer_offer_id').on('change',function(){
    var id = this.value
    getOfferJson(id, function(result){
      $('#sell_point_offer_price').val(result.price);
    });
  });

  function getOfferJson(id, callback) {
    var result = null;
    $.ajax({
      type: 'GET',
      url: "/offers/"+id+".json",
      dataType: 'json',
      success: function(data) {
        result = data;
        if(typeof callback === "function") callback(data);
      }
    });
  }

})