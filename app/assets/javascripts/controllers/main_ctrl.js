app.controller('MainCtrl', ['$scope', '$state', '$location', function ($scope, $state, $location) {
  var main = this;
  
  main.search = $location.search().q;

  $scope.$watch('main.search', function (search) {
    if (search!=undefined) {
      $state.transitionTo("search_path").then(function () {
        $location.search({q: search})
      })
    }
  })
}])