do (angular)->

  selectOption = ($timeout) ->
    restrict: 'A'
    replace: true
    link: (scope, element, attr)->
      template = (width)->
          "<div style='width: #{width}px' class='select-item animated bounceIn'></div>"

      # Select option the directive init
      $timeout ->
        initialMenu = jQuery('body').attr 'class'
        toggle = jQuery('.navbar-toggle').is(":visible")
        if !toggle
          initialMenu = initialMenu.replace('trident-', '')
          $option = jQuery ".trident-menu-item-#{initialMenu}"
          width = $option.width()
          $option.append(template(width))
        else
          jQuery('.select-item').remove()


      # Remove select option for mobile navegation
      jQuery('.navbar-toggle').click ()->
         jQuery('.select-item').remove()

      # Select option o event
      jQuery(element).on 'click', '.navbar-nav li a', (e) ->
        toggle = jQuery('.navbar-toggle').is(":visible")
        if !toggle
          jQuery('.select-item').remove()
          $menuItem = jQuery(e.target)
          width = $menuItem.parent().width()
          $menuItem.parent().append(template(width))
        else
           jQuery('.navbar-collapse.in').collapse('hide')

  selectOption.$inject = ['$timeout']

  angular.module 'trident'
    .directive 'selectOption', selectOption
