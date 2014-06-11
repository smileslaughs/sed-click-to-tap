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
				if ($(el).children().length) > 0
					console.log('there are children')
					#@findChildren($el.children())
				else
					console.log('no children, put main function here')
			@findChildren(element, settings.findText, settings.replaceText)
			fixers = @.querySelectorAll('[data-'+ settings.ignoreFlag + ']')
			for elem in fixers
				@findChildren(elem, settings.replaceText, settings.findText)
				console.log('how we are ignoring')

#now to fix children
			
#needs to go down and find child elements

