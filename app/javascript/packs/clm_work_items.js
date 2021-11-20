$(document).on('turbolinks:load', function() {
    
    //$input = $('*[data-behavior="autocomplete-clm-work-items"]')
    //$input = $('*[id= "clm_work_item_id"][type="search"]')
    $input = $('*[data-behavior="autocomplete-clm-work-items"]').on("change", function(){
            console.log(this.id);
            $('*[type="hidden"][id='+this.id+']').val(this.val);
        });
    
    var options = {
        url: function(phrase) {
        return "/clm_work_items/search.json?q=" + phrase;
        },
        getValue: "name",
        
        list: {

                   onClickEvent: function() {
                        //selected_clm_work_item_id = $('*[id= "clm_work_item_id"][type="search"]').getSelectedItemData().id;
                    //alert( $('*[data-behavior="autocomplete"]').getSelectedItemData().id );
                       // $('*[id = "card_clm_work_item_id"]').val(selected_clm_work_item_id);
                    },
                    showAnimation: {
            			type: "slide",
            			time: 300
            		},
            		
            		hideAnimation: {
            			type: "slide",
            			time: 300
            		}
                },
                
        theme: "round"
    };
    
    $input.easyAutocomplete(options);
    
  
  // your code
  //var options = {
  //  data: ["John", "Paul", "George", "Ringo"]
  //}//;
  //$('*[data-behavior="autocomplete"]').easyAutocomplete(options);
  
});
