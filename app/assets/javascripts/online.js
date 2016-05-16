app.run(['$interval', 'User', function ($interval, User) {
  User.touch();
  
  $interval(function () {
    User.touch();
  }, 5*60*1000)
}])