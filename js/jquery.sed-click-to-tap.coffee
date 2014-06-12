$ = jQuery
$.fn.extend
	clicktotap: (options) ->
		settings =
			clickText: ["click", "clicked", "clicking"]
			touchText: ["tap", "tapped", "tapping" ]
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
					settings.clickText.forEach (text, i) ->
						exp = "/\\b" + text + "\\b/"
						re = new RegExp(eval(exp))
						v = v.replace(re, settings.touchText[i])
						textNode.nodeValue = v
				else
					settings.touchText.forEach (text, i) ->
						exp = "/\\b" + text + "\\b/"
						re = new RegExp(eval(exp))
						v = v.replace(re, settings.clickText[i])
						textNode.nodeValue = v



			arr = []
			originals = @.querySelectorAll('[data-'+ settings.ignoreFlag + ']')
			for el in originals
				arr.push(el.innerHTML)

			walk @

			changed = @.querySelectorAll('[data-'+ settings.ignoreFlag + ']')
			for el, i in changed
				el.innerHTML = arr[i]




