# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).scroll ->
	h = $(document).height()- $(window).height()
	c = $(document).scrollTop()  * 2
	opacity = c / h
	$('.to_top').css 'opacity', opacity 

$(document).ready ->
	$('.to_top').click ->
  		$("html, body").animate
    		scrollTop: 0, "slow"
  		false	
