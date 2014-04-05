

checkFooter = ->
	h = $(document).height() 
	w = $(window).height()
	if h <= w 
		$('.low_nav').css "position","absolute"
		false
	$("#nav_link").click ->
  		$("html, body").animate
    		scrollTop: $(document).height(), "slow"
  		false	
		

$(document).on('ready resize page:load', checkFooter)


