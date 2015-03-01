(function()
 {
	var mlnews = angular.module("mlnews",
    	[
          'templates',
          'ngRoute',
          'ngResource',
          'ui.bootstrap',
          'appControllers',
          'appServices',
        ]);
          
     mlnews.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider)
          {
          	$locationProvider.html5Mode(true);
          
          $routeProvider
          .when('/',
          {
          templateUrl: "html/index.html",
          controller: "homeController"
          })
          .otherwise(
          {
          redirectTo: '/'
          });
          }]);
 })();
