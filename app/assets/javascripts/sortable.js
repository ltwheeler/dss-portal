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
		//sends the ordered array of ids (itm_arr)
		if (evt == "reorder")
		{					
			pobj = {favorites: itm_arr};        
			$.post("/favorites/reorder", pobj);
		}

		//create:	
		//sends the ordered array of ids (itm_arr)
		//sends the id 
		//sends the app type
		if (evt == "create")
		{
			app_id = item.attr('id');
			app_type = item.attr('class');
			pobj = {favorites: itm_arr, app: app_id, app_type: app_type};  
			//submits the request, and codes the favorite id back into the element      
			$.post("/favorites/drag_create", pobj, function(data) {
				$("#" + data.old_id).attr('id', data.new_id);
			});
		}

		//destroy:
		//sends the ordered array of ids (itm_arr)	
		//sends the id
		if (evt == "destroy")
		{
			app_id = item.attr('id');
			app_type = item.attr('class');
			pobj = {favorites: itm_arr, app: app_id};  
			//submits the request, and codes the favorite id back into the element      
			$.post("/favorites/drag_destroy", pobj, function(data) {
				$("#" + data.old_id).attr('id', data.app_id);
				$("#" + data.old_id).addClass(data.app_type).removeClass('favorite');					
			});
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

	//captures 'create favorite' and 'destroy favorite' events on drop
	receive: function(event, ui) 
	{  
		if(newList.attr('id') == "sortableFav")
		{
			evt = "create";
		}	
		else if(newList.attr('id') == "sortableApp")
		{
			evt = "destroy";
		}
        },
	connectWith: ".connectedSortable"
	}).disableSelection();
});
