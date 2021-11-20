
$(document).on('turbolinks:load', function() {
    
    
    $input = $('*[data-behavior="autocomplete-clm-task-types"]').on("change", function(){
        console.log(this.id);
        $('*[type="hidden"][id='+this.id+']').val(this.val);
    });
    //$input = $('*[type="search"]')
    //alert($input);
    
    var options = {
        url: function(phrase) {
        return "/task_types/search.json?q=" + phrase;
        },
        getValue: "name",
        
        list: {

                   onSelectItemEvent: function() {
                       //alert($this);
                        //changed_field = changed_field.target == null ? changed_field[0].id : changed_field.target.id;
                        //var id = changed_field.substring(changed_field.indexOf("attributes_")+11,changed_field.indexOf("_start_time"));
                        //var id = changed_field.slice(changed_field.search(/[0-9]/),changed_field.search(/[0-9]_/)+1);
                        
                        //var start_date_str = ( id == "") ? '*[id= "card_start_time"]' : '*[id= "card_entries_attributes_'+id+'_start_time"]';
                        
                        //selected_task_type_id = $('*[id= "task_type_id"][type="search"]').getSelectedItemData().id;
                    //alert( $('*[data-behavior="autocomplete"]').getSelectedItemData().id );
                        //$('*[id = "card_task_type_id"]').val(selected_task_type_id);
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