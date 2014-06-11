$ = jQuery
$.fn.extend
	clicktotap: (options) ->
		settings =
			clickText: "click"
			touchText: "tap"
			ignoreFlag: "sctignore"

		settings = $.extend settings, options


		@each () ->
			@findChildren = (el, find, replace) ->
				textContent = el.innerHTML
				re = new RegExp(find, "gi")
				if textContent.match(re)
					textContent = textContent.replace(re, replace)
					el.innerHTML = textContent

			element = @
#check for touch support
			supportsTouch = 'ontouchstart' in window || navigator.msMaxTouchPoints
			console.log(supportsTouch)
			if supportsTouch
				@findChildren(element, settings.clickText, settings.touchText)
				fixers = @.querySelectorAll('[data-'+ settings.ignoreFlag + ']')
				for element in fixers
					@findChildren(element, settings.clickText, settings.touchText)
			else
				@findChildren(element, settings.touchText, settings.clickText)
				fixers = @.querySelectorAll('[data-'+ settings.ignoreFlag + ']')
				for element in fixers
					@findChildren(element, settings.touchText, settings.clickText)


