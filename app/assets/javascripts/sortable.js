$(window).load(function() 
{
	var oldList, newList, item, evt, itm_arr, pobj;	
	
	$( "#sortableFav, #sortableApp" ).sortable({
	
	//records the originating list, and sets starting values
	start: function(event, ui) 
	{
		item = ui.item;
		newList = oldList = ui.item.parent();
		evt = "";	
	},
	
	//packages and sends request data to rails
        stop: function(event, ui) 
	{          
		itm_arr = $("#sortableFav").sortable('toArray');

		//reorder:
		//sends the event
		//sends the ordered array of ids (itm_arr)
		if (evt == "reorder")
		{
					
		pobj = {favorites: itm_arr, eventType: evt};        
		$.post("/favorites/reorder", pobj);
		}

		//create:
		//sends the event	
		//sends the ordered array of ids (itm_arr)
		//sends the id (not used if is_rm == 0)
		//sends a is_rm 0 or 1
		if (evt == "create")
		{
		
		}

		//delete
		//sends the event
		//sends the ordered array of ids (itm_arr)	
		//sends the id
		//sends a is_rm 0 or 1
		if (evt == "delete")
		{
		
		}
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
