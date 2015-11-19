$(document).on('click', '.prop_filter_by_map_button', function(){
    $('#prop_filter_by_map').removeClass('hidden');
    $('#prop_filter').addClass('hidden');
    $('.prop_filter_by_map_button').hide();
    $('.prop_filter_button').show();
});

$(document).on('click', '.prop_filter_button', function(){
    $('#prop_filter').removeClass('hidden');
    $('#prop_filter_by_map').addClass('hidden');
    $('.prop_filter_button').hide();
    $('.prop_filter_by_map_button').show();
});
