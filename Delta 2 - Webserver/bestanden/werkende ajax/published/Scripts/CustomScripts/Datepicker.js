$(document).ready(function () {
    if (!Modernizr.inputtypes.date) {
        $(".datecontrol").datepicker({ format: "yyyy-mm-dd" });
    }
});
