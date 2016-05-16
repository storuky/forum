function PostSerializer (collection) {
  var result = [];

  _.each(collection, function (item) {
    result.push({
      id: item[0],
      title: item[1],
      content: item[2],
      user: {
        id: item[3],
        created_at: item[4],
        name: item[5],
        rating: item[6],
        posts_count: item[7],
        avatar_url: item[8] || "/default_avatar.png"
      },
      topic: {
        id: item[9],
        title: item[10]
      }
    })
  })

  return result
}