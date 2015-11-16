$(document).ready(function(){
  console.log('filters are hidden');
  $('.prop_filter').hide();
  $('.prop_filter_by_map').hide();
});

$(document).on('click', '.prop_filter_by_map_button', function(){
    $('.prop_filter_by_map').show();
    $('.prop_filter').hide();
    $('.prop_filter_by_map_button').hide();
    $('.prop_filter_button').show();
});

$(document).on('click', '.prop_filter_button', function(){
    $('.prop_filter').show();
    $('.prop_filter_by_map').hide();
    $('.prop_filter_button').hide();
    $('.prop_filter_by_map_button').show();
});
