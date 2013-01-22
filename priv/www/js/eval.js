$(document).ready(function() {
  $('form#eval').submit(function(event){
    var form = $(this);
    var code = $('#code').val();
    $.post(form.attr('action'), {code: code}, function(data) {
      $('#result').html(data);
    });
    event.preventDefault();
    return false;
  });

  $('#code').each(function(){
    var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
      lineNumbers: true,
      theme: 'default',
      onKeyEvent: function(instance, event) { instance.save(); }
    });
  });
});

