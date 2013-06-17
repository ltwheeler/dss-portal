$(window).load(function() {
	var oldList, newList, item, evt, itm_arr, pobj;	
	$( "#favoritesList, #appsList" ).sortable({
	
	//records the originating list, and sets starting values
	start: function(event, ui) 
	{
		item = ui.item;
		newList = oldList = ui.item.parent();
		evt = "";	
	},
	
	//sends event data to rails
        stop: function(event, ui) 
	{          
		
		// alert("Moved " + item.text() + " from " + oldList.attr('id') + " to " + newList.attr('id'));
		//logic to build the new 'favorite' list

		//itm_arr = $("#sortable").sortable('toArray');


	
		//alert(oldList.attr('id'));
		//alert(ui.sender);
		
		//pobj = {favorites: itm_arr, eventType: evt};        
		//$.post("/favorites/reorder", pobj);
        },



	//updates the target list during drag
        change: function(event, ui) 
	{  
            if(ui.sender) newList = ui.placeholder.parent();
        },

	//captures reorder events on drop
	update: function(event, ui)
        {
		if (newList == oldList)
		{
			evt = "reorder";
		}
	},

	//captures 'create favorite' and 'delete favorite' events on drop
	receive: function(event, ui) 
	{  
		if(newList.attr('id') == "favoritesList")
		{
			evt = "create";
		}	
		else if(newList.attr('id') == "appsList")
		{
			evt = "delete";
		}
        },
      connectWith: ".connectedSortable"
    }).disableSelection();
  });
