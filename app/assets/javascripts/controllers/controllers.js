var appControllers = angular.module('appControllers', ['appServices']);

appControllers.controller('homeController', ['$scope','articleFactory', function($scope, articleFactory)
{
	//Set <body id>
    $scope.$root.body_id = "home";
    
    this.show_news = true;
    this.show_article = false;
    this.search = 'Mindabaal';
	
	$scope.countlimit = 9;
	
    $scope.major_news = articleFactory.getMajorArticles();
    
    this.showArticle = function(article, img_class)
    {
    	$scope.img_type = img_class;
    	$scope.current_article = article;
    	this.show_news = false;
    	this.show_article = true;
    };
    
    this.closeArticle = function()
    {
    	$scope.current_article = "";
    	this.show_news = true;
    	this.show_article = false;
    };
    
    this.filter = function(filter)
    {

    	this.search = filter;
    	$scope.countlimit = 60;
    };
    
    this.reset = function()
    {
    	this.search = "";
    	$scope.countlimit = 9;
    }
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
}]);

appControllers.controller('authorController', ['$scope', 'authorFactory', 'articleFactory', function($scope, authorFactory, articleFactory)
{
	//Set <body id>
	$scope.$root.body_id = "author";
	
	$scope.signed_in = false;
	$scope.add_news_section = false;
	

	authorFactory.authorCheck().$promise
	.then(function(result)
	{
		//$scope.session = result;
		$scope.author = result;
		$scope.signed_in = true;
	},
	function()
	{
		$scope.signed_in = false;
	});
	
	$scope.author_sign_in = function()
	{
		authorFactory.authorLogin($scope.sign_in)
		.then(function(result)
		{
			$scope.author = result;
			//Set the session id
			$scope.signed_in = true;
		});
	};

	$scope.author_sign_out = function()
	{
		authorFactory.authorLogOut($scope.author.user_id);

		$scope.author = "";
		$scope.signed_in = false;
	}

	$scope.add_news = function()
	{
		$scope.add_news_section = true;
	};

	$scope.hide_news = function()
	{
		$scope.add_news_section = false;
	};
	
	$scope.save_article = function()
	{
		articleFactory.addArticle($scope.new_article, $scope.author);
		
		$scope.new_article = "";
	};
}]);