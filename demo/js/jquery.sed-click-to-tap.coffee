$ = jQuery
$.fn.extend
	clicktotap: (options) ->
		settings =
			findText: "click"
			replaceText: "tap"
			ignoreFlag: "sctignore"

		settings = $.extend settings, options


		@each () ->
			element = @
			@findChildren = (el, find, replace) ->
				textContent = el.innerHTML
				re = new RegExp(find, "gi")
				if textContent.match(re)
					textContent = textContent.replace(re, replace)
					el.innerHTML = textContent
			@findChildren(element, settings.findText, settings.replaceText)
			fixers = @.querySelectorAll('[data-'+ settings.ignoreFlag + ']')
			for elem in fixers
				@findChildren(elem, settings.replaceText, settings.findText)


