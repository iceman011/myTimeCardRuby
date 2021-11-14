document.addEventListener("turbolinks:load", () => {
    $('[data-tooltip-display="true"]').tooltip(),
    flatpickr("[class='flatpickr']", {})

});


$(document).on("turbolinks:load", function () {

    init_card();
  
      
    /*function add_fields(link, association, content) {
      var new_id = new Date().getTime();
      var regexp = new RegExp("new_" + association, "g")
      
      alert($(link).parent().id)
      
      $(link).parent().insert({
        before: content.replace(regexp, new_id)
      });
    }*/

  
});

function init_card (){
  
  $('[id$=_start_time]').on("change", function(data){
    //alert(data);
    //alert($(this));
    update_card_duration(data);
  });
  
  $('*[id= "card_start_time_t"]').on("change", function(data){
    //alert($(this).val());
    update_card_duration($(this));
  });
  
  $('[id$=_end_time]').on("change", function(data){
    //alert($(this).val());
    update_card_duration($(this));
  });
  
  $('*[id= "card_end_time_t"]').on("change", function(data){
      update_card_duration($(this));
    //alert($(this).val());
  });
  
  
  $(document).on('focusout', 'input', function(){
   // console.log("Saving value " + $(this).val());
    $(this).data('val', $(this).val());
    
    }).on('change','input', function(){
        var prev = $(this).data('val');
        var current = $(this).val();
        
        console.log("Prev value " + prev + " New Value " +current);
        //console.log("New value " + current);
        //console.log($('.remove_link') );
    });
  
    $('.remove_link').click(function() {
    //$('*[.remove_link]').on("click", function(data){
        // Some complex code
        //alert($(this));
          $(this).prev("input[type=hidden]").value = "1";
          $(this).parent(".nested-fields").hide();
    
        return false;
      });
      
      
      const observer = new MutationObserver(function(mutations_list) {
    	mutations_list.forEach(function(mutation) {
    		mutation.addedNodes.forEach(function(added_node) {
    			//if(added_node.id == 'child') {
    			  init_card();
    				//console.log('#child has been added');
    				observer.disconnect();
    			//}
    		});
    	});
    });
    observer.observe(document.querySelector("#card_form_fields"), { subtree: true, childList: true });
}

function update_card_duration (changed_field){
    
    changed_field = changed_field.target.id
    var id = changed_field.substring(changed_field.indexOf("attributes_")+11,changed_field.indexOf("_start_time"));
    var start_date_str = '*[id= "card_entries_attributes_'+id+'_start_time"]';
    var end_date_str = '*[id= "card_entries_attributes_'+id+'_end_time"]';
    var duration_str = '*[id= "card_entries_attributes_'+id+'_duration"]';
    //alert(id);
    
    //alert(start_date + ' ' + end_date + ' ' + start_time + ' ' + end_time + ' '+date_diff + ' ' + time_diff);
    var start_date_val = $(start_date_str).val();
    var start_date = new Date(  start_date_val == null || start_date_val == '' ? '01/01/1900' : start_date_val  );
    
    //alert(start_date);
    
    //var end_date_val = $('*[id= "card_end_time"]').val();
    var end_date_val = $(end_date_str).val();
    var end_date = new Date(  end_date_val == null || end_date_val == '' ? '01/01/2900' : end_date_val  );
    
    var start_time_val = ($('[id= "card_start_time_t"]').length == 0 ? '00:00:00' : $('[id= "card_start_time_t"]').val());
    var end_time_val =  ( $('[id= "card_end_time_t"]').length == 0 ? '00:00:00' : $('[id= "card_end_time_t"]').val());
    
    var start = new Date ( start_date.getFullYear() , start_date.getMonth(), start_date.getDate() , start_time_val.substring(0, start_time_val.indexOf(':')), start_time_val.substring(start_time_val.indexOf(':')+1) );
    var end = new Date ( end_date.getFullYear() , end_date.getMonth(), end_date.getDate() , end_time_val.substring(0, end_time_val.indexOf(':')), end_time_val.substring(end_time_val.indexOf(':')+1) );

        //reset to old value if start date > end_date
    if( start > end )
    {
        $(start_date_str).val($(start_date_str).data('val'));
        $(end_date_str).val($(end_date_str).data('val'));
        
        //$('*[id= "card_start_time_t"]').val($('*[id= "card_start_time_t"]').data('val'));
        //$('*[id= "card_end_time_t"]').val($('*[id= "card_end_time_t"]').data('val'));
        
        return;
    } 

    diff = end - start;

    var diffDays = Math.floor(diff / 86400000); // days
    var diffHrs = Math.floor((diff % 86400000) / 3600000); // hours
    var diffMins = Math.round(((diff % 86400000) % 3600000) / 60000); // minutes

   
    //alert(' Date : ' + start_date_val + ' Time : ' + start_time_val + ' Start: ' + start);
    //alert(' Start: ' + start + ' End: ' + end + " Diff : " +diff);
    //alert(diffDays + " days, " + diffHrs + " hours, " + diffMins + " minutes");
    //alert($('*[id= "card_start_date"]').defaultValue()+ ' '+ $('*[id= "card_start_date"]').Value());

    $(duration_str).val(diffDays+'d '+diffHrs+'h '+ diffMins+'m');
}


//observer.observe(document, { subtree: false, childList: true });
//observer.observe($('[id=card_form_fields]'), { subtree: false, childList: true });


/*
$('input[name="card[task_type_id]"]').change(function() { 
    alert('changed'); 
    
});


$('*[id= "task_type_id"]').change(function(){ 
  alert($(this).val());
});
*/


/*
function remove_fields(link) {
  $(link).previous("input[type=hidden]").value = "1";
  $(link).up(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).up().insert({
    before: content.replace(regexp, new_id)
  });
}
*/

