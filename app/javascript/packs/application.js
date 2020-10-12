// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks")
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("bootstrap")
require("packs/custom")


var MoviePopup = {
    setup: function() {
      // add hidden 'div' to end of page to display popup:
      var popupDiv = $('<div id="movieInfo"></div>');
      popupDiv.hide().appendTo($('body'));
      $(document).on('click', '#movies a', MoviePopup.getMovieInfo);
    }
    ,getMovieInfo: function() {
      $.ajax({type: 'GET',
              url: $(this).attr('href'),
              timeout: 5000,
              success: MoviePopup.showMovieInfo,
              error: function(xhrObj, textStatus, exception) { alert('Error!'); }
              // 'success' and 'error' functions will be passed 3 args
             });
      return(false);
    }
    ,showMovieInfo: function(data, requestStatus, xhrObject) {
      // center a floater 1/2 as wide and 1/4 as tall as screen
      var oneFourth = Math.ceil($(window).width() / 4);
      $('#movieInfo').
        css({'left': oneFourth,  'width': 2*oneFourth, 'top': 250}).
        html(data).
        show();
      // make the Close link in the hidden element work
      $('#closeLink').click(MoviePopup.hideMovieInfo);
      return(false);  // prevent default link action
    }
    ,hideMovieInfo: function() {
      $('#movieInfo').hide();
      return(false);
    }
  };
  $(MoviePopup.setup);



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
