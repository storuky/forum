function UserSerializer (collection) {
  var result = [];

  _.each(collection, function (item) {
    result.push({
      id: item[0],
      created_at: item[1],
      updated_at: item[2],
      name: item[3],
      avatar_url: item[4],
      posts_count: item[5],
      rating: item[6],
      banned: item[7]
    })
  })
  return result
}