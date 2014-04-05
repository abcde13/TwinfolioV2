

checkRealFooter = ->
	h = $(document).height() 
	w = $(window).height()
	if h <= w 
		$('.footer').css "position","absolute"
		false
		

$(document).on('ready page:load', checkRealFooter)


