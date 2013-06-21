$(document).ready(function () {
  // $('#falseinput').click(function(event){
  //     event.preventDefault();
  //    $('#fileinput').click();
  // });
  


    $('#myForm').submit(function (event) {
        event.preventDefault();
        //console.log($('input[name=username]').val());
        var data = {
            username: $('input[name=username]').val()
        };
        $.get('/images.html', data, function (html) {
            $('.results').append(html);
        });
    });
});
