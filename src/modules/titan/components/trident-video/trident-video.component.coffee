do (angular)->
  class TridentVideoController
    $routerOnActivate: (next, previous) ->
      @videoId = next.params.videoId
      @videoURL = "https://player.vimeo.com/video/#{@videoId}"

  angular.module 'titan'
    .component 'tridentVideo',
      templateUrl: 'titan/components/trident-video/trident-video.view.html'
      controller: 'TridentVideoController as vm'
    .controller 'TridentVideoController', TridentVideoController
