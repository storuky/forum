function ThemeSerializer (collection) {
  var result = [];

  _.each(collection, function (item) {
    result.push({
      id: item[0],
      title: item[1]
    })
  })
  return result
}