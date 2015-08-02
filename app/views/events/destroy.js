$('.delete_event').bind('ajax:success', function(){
      $(this).parent().parent().fadeOut();
});
