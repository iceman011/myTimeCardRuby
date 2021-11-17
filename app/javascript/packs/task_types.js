
$(document).on('turbolinks:load', function() {
    
    
    $input = $('*[data-behavior="autocomplete"]')
    //$input = $('*[type="search"]')
    //alert($input);
    
    var options = {
        url: function(phrase) {
        return "/task_types/search.json?q=" + phrase;
        },
        getValue: "name",
        
        list: {

                   onClickEvent: function() {
                        //selected_task_type_id = $('*[id= "task_type_id"][type="search"]').getSelectedItemData().id;
                    //alert( $('*[data-behavior="autocomplete"]').getSelectedItemData().id );
                       // $('*[id = "card_task_type_id"]').val(selected_task_type_id);
                    }
                }

    };
    
    $input.easyAutocomplete(options);
    
  
  // your code
  //var options = {
  //  data: ["John", "Paul", "George", "Ringo"]
  //}//;
  //$('*[data-behavior="autocomplete"]').easyAutocomplete(options);
  
});