$(document).ready(function() {

  $("#feature-presentation").owlCarousel({
    jsonPath : 'app/assets/javascripts/feature_presentation.json',
    debugger;
    jsonSuccess : customDataSuccess
  });

  function customDataSuccess(data){
    var content = "";
    for(var i in data["items"]){

       var img = data["items"][i].img;
       var alt = data["items"][i].alt;

       content += "<img src=\"" +img+ "\" alt=\"" +alt+ "\">"
    }
    $("feature-presentation").html(content);
  }

});
