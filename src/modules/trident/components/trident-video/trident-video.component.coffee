do (angular)->
  class TridentVideoController

    @$inject: ['VideoMenuService']
    constructor: (@videoMenuService)->
      #TODO: For now all the videoIds are the same so it retrieve the wrong title.
      @videoMenuService
        .getItems()
        .then (@items)=>
          for item of @items
            videos = @items[item]['videos']
            @selectedVideo =  _.find videos, (video) =>
             return video.videoId is @videoId
            if @selectedVideo
              return 


    $routerOnActivate: (next, previous) =>
      @videoId = next.params.videoId
      @videoURL = "https://player.vimeo.com/video/#{@videoId}?autoplay=1"

  angular.module 'trident'
    .component 'tridentVideo',
      templateUrl: 'trident/components/trident-video/trident-video.view.html'
      controller: 'TridentVideoController as vm'
    .controller 'TridentVideoController', TridentVideoController
