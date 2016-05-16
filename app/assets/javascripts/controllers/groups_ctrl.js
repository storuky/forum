app.controller('GroupsCtrl', ['$scope', 'Group', 'action', 'Theme', function ($scope, Group, action, Theme) {
  var ctrl = this;

  action('index', function () {
    ctrl.groups = Group.get();

    ctrl.destroy_theme = function (theme) {
      if (confirm("Вы уверены?"))
        Theme.destroy({id: theme.id})
    }

    ctrl.destroy_group = function (group) {
      if (confirm("Вы уверены?"))
        Group.destroy({id: group.id})
    }
  })

  action('new', function () {
    ctrl.group = Group.new();
    ctrl.save = Group.create;
  })

  action('edit', function (params) {
    ctrl.group = Group.edit(params);
    ctrl.save = Group.update;
  })
}])