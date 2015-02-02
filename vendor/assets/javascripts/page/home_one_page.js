/*  ::

    :: Theme        : Jets
    :: Theme URI    : http://labs.funcoders.com/html/Jets

    :: File         : home.js
    :: About        : Scripts for Home page
    :: Version      : 1.3

::  */
var Home = {
    init: function() {

        this.slider();
        this.onePage();

    },
    slider : function () {
        $(window).on('load', function () {

            setTimeout(function() {

                var revolutionSlider = $('#page-slider'),
                    startwidth = (revolutionSlider.parents('body.w970').length) ? 960 : 1170;

                revolutionSlider.revolution({
                    delay           : 9000,
                    startheight     : 500,
                    hideThumbs      : 10,

                    touchenabled    : 'on',
                    onHoverStop     : 'on',
                    startwidth      : startwidth,

                    navOffsetHorizontal : 0,
                    navOffsetVertical   : 0,

                    stopAtSlide     : -1,
                    stopAfterLoops  : -1,

                    fullWidth       : 'on'
                });

                revolutionSlider.bind('revolution.slide.onloaded', function (e, data) {
                    $(this).parent().css({
                        background  : 'transparent',
                        height      : 'auto',
                        overflow    : 'visible'
                    }).children().animate({
                        opacity     : 1
                    }, 500);
                });

            }, 100);
        });
    },
    onePage: function() {

         // update Bootstrap scrollspy prototype
        $.fn.scrollspy.Constructor.prototype.activate = function(target) {
            this.activeTarget = target;

            $(this.selector).parents('li').removeClass('current');

            var selector = this.selector + '[data-target="' + target + '"],' + this.selector + '[href="' + target + '"]',
                active = $(selector).parents('li').addClass('current');

            if (active.parent('.dropdown-menu').length) {
                active = active.closest('li.dropdown').addClass('current');
            }

            active.trigger('activate.bs.scrollspy');
        };

        $(window).on('load', function() {
            $(this).imagesLoaded(function() {
                setTimeout(function() {
                    $('body').scrollspy({
                        target: '.navbar-inner',
                        offset: 55
                    });
                }, 5000);
            });
        });

        // Navigate animation
        $('ul#main-menu > li > a').on('click', function(e) {

            var $that = $(this),
                blockID = $that.attr('href'),
                headerH,
                toBlock;

            if (blockID.substring(0, 1) === '#' && !$that.parent().is('.search-nav')) {

                e.preventDefault();

                headerH = ($(window).width() < 992) ? 0 : 55;
                toBlock = (blockID === '#home') ? 0 : $(blockID).offset().top - headerH + 'px';

                $that.parent('li').addClass('current').siblings().removeClass('current');
                $('html,body').animate({
                    scrollTop: toBlock
                }, 600, 'easeOutQuad');
            }
        });
    }
};

Home.init();