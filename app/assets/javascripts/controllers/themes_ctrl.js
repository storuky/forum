app.controller('ThemesCtrl', ['$scope', 'Theme', 'Topic', 'action', '$location', function ($scope, Theme, Topic, action, $location) {
  var ctrl = this;

  action('show', function (params) {
    var filter = {
      theme_id: params.id
    }

    ctrl.theme = Theme.get(params);
    
    ctrl.query = function (page) {
      Topic.get({
        filter: filter,
        page: page
      }, function (res) {
        ctrl.topics = res;
      });
    }

    ctrl.query($location.search().page || 1)

    ctrl.destroy = function (topic) {
      if (confirm("Вы уверены?"))
        Topic.destroy({id: topic.id})
    }
  })

  action('new', function () {
    Theme.new(function (res) {
      ctrl.theme = res;
      ctrl.theme.group_id = $location.search().group_id;
    });
    ctrl.save = Theme.create;
  })

  action('edit', function (params) {
    ctrl.theme = Theme.edit(params);
    ctrl.save = Theme.update;
  })
}])