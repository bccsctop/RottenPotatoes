var MovieListFilter = {
  filter_G: function () {
    // 'this' is *unwrapped* element that received event (checkbox)
    if ($(this).is(':checked')) {
      $('tr.G').show();
    } else {
      $('tr.G').hide();
    };
  },
  filter_PG: function () {
    // 'this' is *unwrapped* element that received event (checkbox)
    if ($(this).is(':checked')) {
      $('tr.PG').show();
    } else {
      $('tr.PG').hide();
    };
  },
  filter_PG_13: function () {
    // 'this' is *unwrapped* element that received event (checkbox)
    if ($(this).is(':checked')) {
      $('tr.PG-13').show();
    } else {
      $('tr.PG-13').hide();
    };
  },
  filter_R: function () {
    // 'this' is *unwrapped* element that received event (checkbox)
    if ($(this).is(':checked')) {
      $('tr.R').show();
    } else {
      $('tr.R').hide();
    };
  },
  filter_NC_17: function () {
    // 'this' is *unwrapped* element that received event (checkbox)
    if ($(this).is(':checked')) {
      $('tr.NC-17').show();
    } else {
      $('tr.NC-17').hide();
    };
  },
  setup: function() {
    // construct checkbox with label
    var labelAndCheckbox =
      $('<label for="G_filter">G</label>' +
        '<input type="checkbox" id="G_filter" checked/>'+
        '<label for="PG_filter">PG</label>' +
        '<input type="checkbox" id="PG_filter" checked/>'+
        '<label for="PG-13_filter">PG-13</label>' +
        '<input type="checkbox" id="PG-13_filter" checked/>'+
        '<label for="R_filter">R</label>' +
        '<input type="checkbox" id="R_filter" checked/>'+
        '<label for="NC-17_filter">NC-17</label>' +
        '<input type="checkbox" id="NC-17_filter" checked/>' );
      
    labelAndCheckbox.insertBefore('#movies');
    $('#G_filter').change(MovieListFilter.filter_G);
    $('#PG_filter').change(MovieListFilter.filter_PG);
    $('#PG-13_filter').change(MovieListFilter.filter_PG_13);
    $('#R_filter').change(MovieListFilter.filter_R);
    $('#NC-17_filter').change(MovieListFilter.filter_NC_17);
  }
}
$(MovieListFilter.setup); // run setup function when document ready