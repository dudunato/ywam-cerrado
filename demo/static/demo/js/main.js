$(window).on('beforeunload',function(){
});


$(document).ready(function(){
    $('select').select2({minimumResultsForSearch: Infinity});
    // Initializes tooltips
    $('[title]').tooltip({container: 'body'});

    // $('.search-box').width($('.navbar-nav').width() - 105);
    //
    $('.lang-field').change(function(){
       $(this).closest('form').submit();
    });

    //Apply img-thumbnail class to body-content images
    $('.body-content img').addClass("img-thumbnail");
    $('.slogan').textillate({
      loop: true,
      in: { effect: 'flash' },
      out: { effect: 'flash', reverse: true }
    });

    $('#img-cover').height(function(){
       return $(window).height() * 0.8;
    });

    $(window).resize(function() {
      $('#img-cover').height(function(){
         return $(window).height() * 0.8;
      });
    });

    var $video = $('#vid');
    $video.on('canplaythrough', function() {
       this.play();
    });

});

