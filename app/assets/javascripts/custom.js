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
  $('.cleat-btn').click(function() {
    location.reload();
  });
});