/*
= require oxymoron/underscore
= require oxymoron/angular
= require oxymoron/angular-resource
= require oxymoron/angular-cookies
= require angular-ui-router
= require oxymoron/ng-notify
= require oxymoron
= require angular-recaptcha
= require paging
= require_self
= require_tree .
*/

var app = angular.module("app", ['ui.router', 'oxymoron', 'bw.paging', 'vcRecaptcha']);

app.run(['$rootScope', function ($rootScope) {
  $rootScope.gon = gon;
  $rootScope.Routes = Routes;
}])