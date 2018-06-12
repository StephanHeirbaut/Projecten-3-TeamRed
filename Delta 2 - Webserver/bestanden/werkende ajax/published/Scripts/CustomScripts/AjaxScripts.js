function Speaker(id, fullName, pictureUrl, bio) {
    this.id = id;
    this.fullName = fullName;
    this.pictureUrl = pictureUrl;
    this.bio = bio;
}

var speakersView = {
    speakers: [],

    init: function() {
        $("#GetMessage").click(function() {
            speakersView.getMessage();
        });
        $("#GetJson").click(function() {
            speakersView.getJSON();
        });
        $("#AjaxJson").click(function() {
            speakersView.getAJAX();
        });
        $("#GetHTML").click(function () {
            speakersView.getHtml();
        });
        $("#search").click(function () {
            speakersView.search();
        });
    },

    getMessage: function() {
        $.get("/Home/GetMessage", null, function(data) {
            $("#result").html(data);
        })
    },

    getJSON: function() {
        $.getJSON("/Home/GetJson", function(data) {
            speakersView.speakers = $.map(data, function(item) {
                return new Speaker(item.Id, item.FullName, item.PictureUrl, item.Bio);
            });
            speakersView.toHtml();
        });
    },

    getAJAX: function() {
        $.ajax({ url: "/Home/GetJson" })
            .done(function(data) {
                speakersView.speakers = $.map(data, function(item) {
                    return new Speaker(item.Id, item.FullName, item.PictureUrl, item.Bio);
                });
                speakersView.toHtml();
            })
            .fail(function() { alert("error"); })
            .always(function() { alert("complete"); });
    },

    getHtml: function() {
        $.get("/Home/GetHtml", null, function(data) {
            $("#result").html(data);
        });
    },

    search: function () {
        $.get("/Home/Search", { searchTerm: $("#searchTerm").val() }, function(data) {
            $("#result").html(data);
        });
    },

    toHtml: function() {
        $("#result").html("");
        $.each(this.speakers, function(index, item) {
            $("#result").append(item.fullName + "<br/>");
        });
    }
}


$(document).ready(function()
{
    speakersView.init();
});



