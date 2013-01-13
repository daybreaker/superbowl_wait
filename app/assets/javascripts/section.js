$(function(){
  
  /* loosely validate section input */
  $('form').submit(function(){
    success = true;
    numbers = $( "input#section", $(this) ).val();
    if (numbers.length != 3) { success = false; }
    console.log(numbers[0]);
    console.log(numbers[1]);
    console.log(numbers[2]);
    if (numbers[0] < 1 || numbers[0] > 7) { success = false; }
    if (numbers[1] < 0 || numbers[1] > 5) { success = false; }
    if (numbers[2] < 0 || numbers[2] > 9) { success = false; }
    
    if (success !== true) {
      alert("You have entered an invalid section number.");
    }

    else {
      localStorage.setItem('homeSection', numbers);
    }
    return success;
  });

  function toggleSectionInput() {
    numbers = localStorage.getItem('homeSection');
    if (numbers == null) {
      $('#sectionNumber').hide();
      $('#sectionForm').show()
    } else {
      if ($('.chooseSection').length > 0) {
        window.location.replace("/show/" + parseInt(numbers))
      }
      $('#sectionNumber').show();
      $('#sectionForm').hide();
    }
  }

  toggleSectionInput();

  $('#changeSection').click(function() {
    localStorage.removeItem('homeSection');
    toggleSectionInput();
  });

});
