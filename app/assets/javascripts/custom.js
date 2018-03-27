$(document).ready(function(){
    $(".truck_type_change").change(function(){
      var data = "";
      $.ajax({
          type:"GET",
          url : "/trucks.js",
          data : "selectbox1_selectedvalue="+$(this).val(),
          async: false,
          success : function(response) {
            data = response;
            return response;
          },
          error: function() {
            alert('Error occured');
          }
      });
    });
  $('.cleat-btn').click(function() {
    location.reload();
  });
});
$(document).ready(function(){
    $(".load_type_change").change(function(){
      var data = "";
      $.ajax({
          type:"GET",
          url : "/loads.js",
          data : "selectbox1_selectedvalue="+$(this).val(),
          async: false,
          success : function(response) {
            data = response;
            return response;
          },
          error: function() {
            alert('Error occured');
          }
      });
    });
  $('.cleat-btn,.signup-link,.find-load').click(function() {
    location.reload();
  });
});
  var maxmobileLength = 13;
  var maxtrucknumberLength = 13;
  var maxLICnumberLength = 15
  $('#truck_driver_mobile_no').keyup(function() {
    var length = $(this).val().length;
    var length = maxmobileLength-length;
    $('#validate-msg-mobile').text(length);
  });
  $('#truck_vehicle_number').keyup(function() {
    var length = $(this).val().length;
    var length = maxtrucknumberLength-length;
    $('#validate-msg-vehicle-number').text(length);
  });
  $('#truck_licence_number').keyup(function() {
    var length = $(this).val().length;
    var length = maxLICnumberLength-length;
    // $('#validate-msg-vehicle-number').text(length);
  });
$("#datepicker").datepicker({ minDate: 0, dateFormat: 'yy-mm-dd' });