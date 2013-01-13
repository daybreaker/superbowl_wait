$(function(){

  var dome;

  if ( localStorage.getItem('superdome_bg')) {
    dome = localStorage.getItem('superdome_bg');
  }
  else {
    $.get('/get_image', function(data){
      localStorage.setItem('superdome_bg',data);
    })
    
  }

  $("#superdome_bg").attr('src', 'data:image/png;base64,' + dome);  
  
});
