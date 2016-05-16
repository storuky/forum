app.factory('serializerInterceptor', ['$q', function ($q) {
  return {
    response: function (response) {
      if (response.data.serializer) {
        var serializer = window[response.data.serializer];

        if (serializer) {
          collection = serializer(response.data.collection);

          if (response.data.single) {
            response.data.resource = collection[0]
          } else {
            response.data.collection = collection;
          }
        } else {
          console.error(response.data.serializer + " is not defined")
        }
      }
      return response || $q.when(response);
    }
  };
}])
.config(['$httpProvider', function ($httpProvider) {
  $httpProvider.interceptors.push('serializerInterceptor');
}])