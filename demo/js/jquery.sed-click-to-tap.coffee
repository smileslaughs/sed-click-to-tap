$ = jQuery
$.fn.extend
  clicktotap: (options) ->
    settings =
      findText: "click"
      replaceText: "tap"

    settings = $.extend settings, options

    @each () ->
      element = $(@)
      textContent = element.text()
      re = new RegExp(settings.findText, "gi")
      if textContent.match(re)
        textContent = textContent.replace(re, settings.replaceText)
        element.text(textContent)
