jQuery(function () {
    $(document).on('click', '#image-gallery > .thumb > a', function (e) {
        var id = $(this).data('id'),
            imageUrl = $(this).data('image');

        e.preventDefault();
        initDisplay(id, imageUrl);
    });

    $(document).on('click', '.gallery-overlay a.delete', function (e) {
        e.preventDefault();
        var url = $(this).data('url'),
            id = $(this).data('id');
        $.get(url, function () {
            window.location.reload();
        });
    });

    $(document).on('click', '.gallery-overlay [rel~=close]', function (e) {
        hideImage();
    });

    $(window).keyup(function (e) {
        if (e.which == 27 && $(".gallery-overlay:visible").is(':visible')) {
            hideImage();
        }
    });

    $(document).on("click", ".gallery-overlay", function (e) {
        if (e.originalEvent && e.originalEvent.target == e.currentTarget) {
            hideImage();
        }
    });

    function initDisplay(id, imageUrl) {
        $("#thumb-" + id).append($('<span>').addClass('loader'));
        var img = $("<img>").attr('src', window.gallery.uploadPath + "/" + imageUrl);
        img.load(function () {
            showImage(id);
        });
        // $.get(, function () {
        // });
    }

    function hideImage() {
        $(".gallery-overlay").remove();
        $('body').css('overflow', 'auto');
        window.location.hash = '';
    }

    function showImage(id) {
        var ajax = $.ajax({
            url: Config.URL + 'gallery/view/' + id,
            success: function (r) {
                $('body').append(r).css('overflow', 'hidden');
                setTimeout(function () {
                    resizeContainer();
                }, 0);
                window.location.hash = id;
            },
            beforeSend: function () {
                if (ajax) {
                    ajax.stop();
                    $("#image-gallery .thumb .loader").remove();
                }
            },
            complete: function () {
                $("#image-gallery .thumb .loader").remove();
            }
        });
    }

    $(window).resize(function () {
        if ($(".gallery-overlay:visible").length) {
            resizeContainer();
        }
    });

    function resizeContainer() {
        wh = $(window).height();
        ww = $(window).width();
        var container = $('.gallery-overlay > .image-container');
        container.height(wh - 200);


        var imgHolderW = ww - 200 - 360;

        var img = $(".gallery-overlay img.full-image");

        img.css({
            maxWidth: imgHolderW,
            maxHeight: container.height()
        });

        $(".gallery-overlay .info > div").css('max-height', container.height() - 40);

        // center the fucking damn container
        setTimeout(function () {
            container.css({
                'left': (ww - container.width())/2,
                'top': (wh - container.height())/2,
                'opacity': 1
            });
        }, 50);

        setTimeout(function () {
            container.css({
                'left': (ww - container.width())/2,
                'top': (wh - container.height())/2,
                'opacity': 1
            });
        }, 200);

    }

    if (window.location.hash.length > 1) {
        showImage(window.location.hash.replace('#', ''));
        setTimeout(resizeContainer, 1000);
        setTimeout(resizeContainer, 2000);
        setTimeout(resizeContainer, 3000);
    }

});
