$(document).ready(->
	$('.delete_post').on('ajax:success', ->
		$(this).closest('.post-box').fadeOut();
	);
);

$(document).ready(->
	$('.delete_post').on('ajax:success', ->
		$(this).closest('.onecomment').fadeOut();
	);
);


