$('.gmap_coordinate_picker_container').on('focus', function(){
    $('#located_in').removeClass('active'); 
    $('#for_sell').removeClass('active'); 
    $('#area_greater_than').removeClass('active'); 
    $('#area_lesser_than').removeClass('active'); 
    $('#value_greater_than').removeClass('active'); 
    $('#value_lesser_than').removeClass('active'); 
});
$('.gmap_coordinate_picker_container').on('blur', function(){
    $('#located_in').addClass('active'); 
    $('#for_sell').addClass('active'); 
    $('#area_greater_than').addClass('active'); 
    $('#area_lesser_than').addClass('active'); 
    $('#value_greater_than').addClass('active'); 
    $('#value_lesser_than').addClass('active'); 
});
