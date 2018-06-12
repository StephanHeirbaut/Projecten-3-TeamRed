
var hijaxView = {

    init: function () {
        $("form").submit(function () {
            $.post(this.action, $(this).serialize(), function(data) {
                $("#sessionList").html(data);
            });
            return false;  //er wordt niet genavigeerd naar href
        });
    }

  }

$(function () {
    hijaxView.init();
});



