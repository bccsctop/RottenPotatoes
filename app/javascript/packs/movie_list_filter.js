$(document).ready(function()
{
  $('#G_filter').change(function() 
  {
    if(this.checked == true){
      $('tr.G').show();
    } else {
      $('tr.G').hide();
    };
  });

  $('#PG_filter').change(function() 
  {
    if(this.checked == true){
      $('tr.PG').show();
    } else {
      $('tr.PG').hide();
    };
  });

  $('#PG-13_filter').change(function() 
  {
    if(this.checked == true){
      $('tr.PG-13').show();
    } else {
      $('tr.PG-13').hide();
    };
  });

  $('#R_filter').change(function() 
  {
    if(this.checked == true){
      $('tr.R').show();
    } else {
      $('tr.R').hide();
    };
  });

  $('#NC-17_filter').change(function() 
  {
    if(this.checked == true){
      $('tr.NC-17').show();
    } else {
      $('tr.NC-17').hide();
    };
  });
  
});