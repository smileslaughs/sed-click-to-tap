

			@switchText = (el, find, replace) ->
				textContent = el.innerHTML
				re = new RegExp(find, "gi")
				if textContent.match(re)
					textContent = textContent.replace(re, replace)
					el.innerHTML = textContent

			element = @
#check for touch support
			supportsTouch = 'ontouchstart' of document.createElement('div') || navigator.msMaxTouchPoints
			fixers = []
			originals = @.querySelectorAll('[data-'+ settings.ignoreFlag + ']')
			for el in originals
				fixers.push(el.innerHTML)

			console.log(supportsTouch)
			if supportsTouch
				@switchText(element, settings.clickText, settings.touchText)
			else
				@switchText(element, settings.touchText, settings.clickText)

			changed = @.querySelectorAll('[data-'+ settings.ignoreFlag + ']')
			for el, i in changed
				el.innerHTML = fixers[i]
