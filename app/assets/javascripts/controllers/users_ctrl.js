app.controller('UsersCtrl', ['$scope', 'User', 'action', function ($scope, User, action) {
  var ctrl = this;

  action('index', function () {
    ctrl.query = function (page) {
      User.get({page: page}, function (res) {
        ctrl.users = res;
      });
    }

    ctrl.query(1)
  })

  action('show', function (params) {
    ctrl.user = User.get(params);
  })

  ctrl.ban = function (user) {
    User.ban({id: user.id})
    user.banned = true;
  }

  ctrl.unban = function (user) {
    User.unban({id: user.id})
    user.banned = false;
  }
}])