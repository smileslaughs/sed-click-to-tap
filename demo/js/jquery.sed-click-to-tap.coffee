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
			fixers = []
			originals = @.querySelectorAll('[data-'+ settings.ignoreFlag + ']')
			for el in originals
				fixers.push(el.innerHTML)
			if supportsTouch
				@findChildren(element, settings.clickText, settings.touchText)
			else
				@findChildren(element, settings.touchText, settings.clickText)
			changed = @.querySelectorAll('[data-'+ settings.ignoreFlag + ']')

			for el, i in changed
				el.innerHTML = fixers[i]


