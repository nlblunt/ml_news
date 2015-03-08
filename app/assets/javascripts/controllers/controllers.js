var appControllers = angular.module('appControllers', ['appServices']);

appControllers.controller('homeController', ['$scope', function($scope)
{
	//Set <body id>
    $scope.$root.body_id = "home";
}]);

appControllers.controller('adminController', ['$scope', 'authorFactory', function($scope, authorFactory)
{
	//Set <body id>
	$scope.$root.body_id = "admin";
	
	// Holder for nav
	this.nav = 'authors';
	this.content = '';
	
	//Get the list of authors
	$scope.authors = authorFactory.getAuthors();

	this.addAuthor = function(author)
	{
		//Add new author then get a new updated list
		authorFactory.addAuthor($scope.new_author)
		.then(function()
		{
			$scope.authors = authorFactory.getAuthors();
			$scope.new_author = "";
		});
	};
	
	this.deleteAuthor = function(id)
	{
		//Delete the author from the database
		authorFactory.deleteAuthor(id)
		.then(function()
		{
			$scope.authors = authorFactory.getAuthors();
		});
		this.content = "";
	};
	
	this.navIsSelected = function(selected)
	{
		//If this tab is selected show it
		return this.nav === selected;
	};

	this.navSetSelected = function(selected)
	{
		//Set the NAV selected tab
		this.nav = selected;
		//Reset the content to blank
		this.content = "";
	};
	
	this.contentIsSelected = function(selected)
	{
		//Show selected content
		return this.content === selected;
	};
	
	this.contentSetSelected = function(selected)
	{
		//Set the content section
		this.content = selected;
	};
	
	this.contentSetAuthor = function(selected, author)
	{
		//Set the content section for author
		this.content = selected;
		//Load the content section with the clicked on author
		$scope.selected_author = author;
	};
	
	this.contentSetTemplate = function(selected, template)
	{
		//Set the content section for template
		this.content = selected;
		//Load the content section with the clicked on template
		$scope.selected_template = template;
	};
}]);