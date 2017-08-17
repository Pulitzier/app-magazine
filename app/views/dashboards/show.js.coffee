$('#update-container').empty()
$('<%= j(render @dashboard) %>').appendTo("#update-container")
