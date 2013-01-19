$(document).ready(function() {
  $('form#eval').submit(function(event){
    console.log('in submit');
    console.log(event);
    var form = $(this);
    $.post(form.attr('action'), form.serialize(), function(data) {
      $('#result').html(data);
    });
    event.preventDefault();
    return false;
  });
});
