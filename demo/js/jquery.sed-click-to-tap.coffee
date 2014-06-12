$ = jQuery
$.fn.extend
	clicktotap: (options) ->
		settings =
			clickText: "click"
			touchText: "tap"
			ignoreFlag: "sctignore"

		settings = $.extend settings, options


		@each () ->
#cloud-to-butt's recursive DOM traversal, based of an SO answer
			supportsTouch = 'ontouchstart' of document.createElement('div') || navigator.msMaxTouchPoints

			walk = (node) ->
				switch node.nodeType
					when 1,9,11
						child = node.firstChild
						while child
							next = child.nextSibling
							walk child
							child = next
					when 3 then replaceText node

			replaceText = (textNode) ->
				v = textNode.nodeValue
				if supportsTouch
					re = new RegExp(settings.clickText, 'gi')
					v = v.replace(re, settings.touchText)
				else
					re = new RegExp(settings.touchText, 'gi')
					v = v.replace(re, settings.clickText)

				textNode.nodeValue = v

			arr = []
			originals = @.querySelectorAll('[data-'+ settings.ignoreFlag + ']')
			for el in originals
				arr.push(el.innerHTML)
			walk @

			changed = @.querySelectorAll('[data-'+ settings.ignoreFlag + ']')
			for el, i in changed
				el.innerHTML = arr[i]



