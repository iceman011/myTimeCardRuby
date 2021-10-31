$(document).on('turbolinks:load', function() {
    
    
    //$input = $('*[data-behavior="autocomplete"]')
    $input = $('*[id= "clm_work_item_id"][type="search"]')

    var options = {
        url: function(phrase) {
        return "/clm_work_items/search.json?q=" + phrase;
        },
        getValue: "name",
        
        list: {

                   onClickEvent: function() {
                        selected_clm_work_item_id = $('*[id= "clm_work_item_id"][type="search"]').getSelectedItemData().id;
                    //alert( $('*[data-behavior="autocomplete"]').getSelectedItemData().id );
                        $('*[id = "card_clm_work_item_id"]').val(selected_clm_work_item_id);
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
