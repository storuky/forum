function TopicSerializer (collection) {
  var result = [];

  _.each(collection, function (item) {
    result.push({
      id: item[0],
      title: item[1],
      last_post: item[2],
      posts_count: item[3],
      user: {
        id: item[4],
        name: item[5]
      },
      theme: {
        id: item[6],
        title: item[7]
      }
    })
  })
  return result
}