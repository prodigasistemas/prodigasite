/*  ::

    :: Theme        : Jets
    :: Theme URI    : http://labs.funcoders.com/html/Jets

    :: File         : about.js
    :: About        : Scripts for About Us page
    :: Version      : 1.3

::  */
var About = {

    init: function() {
        this.timeline();
    },
    timeline : function () {
        $(document).ready(function() {
            var timeline = $('.timeline');
            if (timeline.length) {
                $('li', timeline).not('.year').each(function(i) {
                    $(this).addClass((i % 2 === 0) ? 'even' : 'odd');
                });
            }
        });
    }
};

About.init();