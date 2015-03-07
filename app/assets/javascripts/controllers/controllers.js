var appControllers = angular.module('appControllers', ['appServices']);

appControllers.controller('homeController', ['$scope', function($scope)
{
    	$scope.$root.body_id = "home";
}]);

appControllers.controller('adminController', ['$scope', function($scope)
{
	$scope.$root.body_id = "admin";
	
	// Holder for nav
	this.nav = 'authors';

	this.navIsSelected = function(selected)
	{
		return this.nav === selected;
	};

	this.navSetSelected = function(selected)
	{
		this.nav = selected;
	};
}]);