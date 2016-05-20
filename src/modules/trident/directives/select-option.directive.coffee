do (angular)->
  #TODO: I have to refactor this code for reuse the template, make it smaller.
  selectOption = ($timeout) ->
    restrict: 'A'
    replace: true
    link: (scope, element, attr)->
      $timeout ->
        initialMenu = jQuery('body').attr 'class'
        initialMenu = initialMenu.replace('trident-', '')
        $option = jQuery ".trident-menu-item-#{initialMenu}"
        width = $option.width()
        $option.append("<div style='width: #{width}px' class='select-item animated bounceIn'></div>")

      jQuery element, 'navbar-nav li'
        .on 'click', (e)->
          toggle = jQuery('.navbar-toggle').is(":visible")
          if !toggle
            jQuery('.select-item').remove()
            $menuItem = jQuery(e.target)
            width = $menuItem.parent().width()
            $menuItem.parent().append("<div style='width: #{width}px' class='select-item animated bounceIn'></div>")

  selectOption.$inject = ['$timeout']

  angular.module 'trident'
    .directive 'selectOption', selectOption
