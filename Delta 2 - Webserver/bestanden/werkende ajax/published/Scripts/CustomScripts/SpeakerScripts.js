function Speaker(id, fullName, pictureUrl, bio) {
    this.id = id;
    this.fullName = fullName;
    this.pictureUrl = pictureUrl;
    this.bio = bio;
}

var speakersView = {
    speaker: null,
    init: function() {
        $(".details").click(function () {
            speakersView.getSpeaker(this);
            return false;  //er wordt niet genavigeerd naar href
        });
    },
    getSpeaker: function (link) {
        $.get(link.href, function(item) {
            speakersView.speaker = new Speaker(item.Id, item.FullName, item.PictureUrl, item.Bio);
            speakersView.toHtml();
        });
    },
    toHtml: function() {
        var box = $("#speaker");
        box.empty();
        box
            .append($("<img>")
                .attr("src", "/Images/Speaker/" + this.speaker.pictureUrl)
                .attr("alt", "pic")
                .addClass("imgSpeaker"))
            .append($("<span>").html(this.speaker.bio));
        $("#speaker").show();
    }
}
$(function() {
    speakersView.init();
});



