app.controller('SearchCtrl', ['$scope', '$location', '$http', function ($scope, $location, $http) {
  var ctrl = this;

  $scope.$watch(function () {
    return $location.search().q
  }, function (q) {
    ctrl.q = q;
    ctrl.query()
  })

  ctrl.query = function (page) {
    var params = {
      page: page || 1
    }

    if (ctrl.q) {
      params.q = ctrl.q
    }

    $http.get(Routes.search_path(params)).then(function (res) {
      ctrl.posts = res.data;
    })
  }
}])