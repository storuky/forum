function GroupSerializer (collection) {
  var result = [],
      groups = _.groupBy(collection, function (el) {
        return el[0]
      });

  _.each(groups, function (group) {
    result.push({
      id: group[0][0],
      title: group[0][1],
      themes: _.map(group, function (item) {
        return {
          id: item[2],
          title: item[3],
          posts_count: item[4],
          topics_count: item[5],
          last_post: item[6]
        }
      })
    })
  })
  return result
}