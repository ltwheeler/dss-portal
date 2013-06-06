$(window).load(function() {
    $("#sortable").sortable({
      update: function(event, ui){
        var itm_arr = $("#sortable").sortable('toArray');
        var pobj = {favorites: itm_arr};
        $.post("/favorites/reorder", pobj);
      }
    });
});

