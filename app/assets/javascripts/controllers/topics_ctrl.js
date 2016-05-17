app.controller('TopicsCtrl', ['$scope', '$location', 'Topic', 'action', 'Post', 'Theme', function ($scope, $location, Topic, action, Post, Theme) {
  var ctrl = this;

  action('show', function (params) {
    var filter = {
      topic_id: params.id
    }

    ctrl.post = {
      topic_id: params.id
    }

    ctrl.topic = Topic.get(params);
     
    ctrl.query = function (page, callback) {
      Post.get({filter: filter, page: page}, function (res) {
        ctrl.posts = res;
        if (callback) callback();
      });
    }

    ctrl.query(1)

    ctrl.send = function () {
      Post.create({post: ctrl.post}, function (res) {
        ctrl.post = {
          topic_id: params.id
        }
        ctrl.query(Math.ceil(ctrl.posts.total_count/20))
      })
    }
  })

  action('new', function () {
    var theme_id = $location.search().theme_id;
    ctrl.theme = Theme.get({id: theme_id});
    ctrl.topic = Topic.new({topic: {theme_id: theme_id}});
    ctrl.save = Topic.create;
  })

  action('edit', function (params) {
    ctrl.topic = Topic.edit(params, function (res) {
      ctrl.theme = Theme.get({id: res.theme_id});
    });
    ctrl.save = Topic.update;
  })
}])