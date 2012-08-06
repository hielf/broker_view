# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('#categories_category_name').autocomplete({
		# minLength: 2
		source: $('#categories_category_name').data('autocomplete-source')
		focus: (event, ui) ->
			$("#categories_category_name").val ui.item.broker_code + "-" + ui.item.broker_name
			false
		select: (event, ui) ->
			$("#categories_category_name").val ui.item.broker_code + "-" + ui.item.broker_name
			# $("#link_broker_id").val ui.item.id
			false
	 })	.data("autocomplete")._renderItem = (ul, item) ->
		    $("<li></li>").data("item.autocomplete", item).append("<a>" + item.broker_code + "-" + item.broker_name + "</a>").appendTo ul