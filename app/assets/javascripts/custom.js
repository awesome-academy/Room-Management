function call_ajax() {
  let name = $('#find_by_name').val();
  $.ajax({
    url: '/search',
    type: 'POST',
    dataType: 'script',
    data: {name: name}
  });
}

$(document).on("turbolinks:load",function(){
  $(document).on ('keyup', '#find_by_name', function(){
    call_ajax();
  });
})
