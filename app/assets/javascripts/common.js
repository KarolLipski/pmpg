$(document).ready(function() {
  $('#check_all:button').toggle(function(){
    console.log('ddd');
        $('input:checkbox').attr('checked','checked');
        $('.checker span').attr('class', 'checked');
        $(this).val('uncheck all');
    },function(){
        $('input:checkbox').removeAttr('checked');
        $('.checker span').removeAttr('class');
        $(this).val('check all');        
    })
});