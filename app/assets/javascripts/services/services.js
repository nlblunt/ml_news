var appServices = angular.module('appServices', ['ngResource', 'angularFileUpload']);

appServices.factory('authorFactory', ['$resource', '$q', '$http', function($resource, $q, $http)
{
    var self = {};
    
    //Author object
    var Author = $resource('/author/:id',{id:'@id'});
    
    //Author (User) seesion object
    var UserSession = $resource('/user/sign_in',
    {
            //Customer API to check admin session.
            user_check: {method:'GET', url:'/user/user_check'}
    });
    
    self.getAuthors = function()
    {
        //Return the list of Authors from server
        return Author.query();
    };
    
    self.addAuthor = function(author)
    {
        //Adds a new author
        
        var deferred = $q.defer();
                
        $http.post('/author', {user:{email: author.email, password: "password", password_confirmation: "password"},author:{name: author.name}})
        .then(function()
        {
            deferred.resolve();
        });
        
        //Setup a defer

        
        //Create the new author object
        //var newAuthor = new Author();
        
        //Set author attributes
        //newAuthor.name = author.name;
        
        //Save author to database
        //newAuthor.$save()
        //.then(function()
        //{
        //    deferred.resolve();
        //});
        
        return deferred.promise;
    };
    
    self.deleteAuthor = function(id)
    {
        //Deletes an author by :id from database
        
        var deferred = $q.defer();
        
        Author.delete({id:id})
        .$promise.then(function()
        {
            deferred.resolve();
        });
        
        return deferred.promise;
    };
    
    self.author_check = function()
    {
        //Check with the server if user is logged in.  Returns session ID.
        return UserSession.user_check();
    };
    
    self.authorLogin = function(login)
        {
            //Setup a deferred promise
            var deferred = $q.defer();

            //Create a new UserSession object.  Save to backend for authorization.
            var user = new UserSession({email: login.email, password: login.password});
            
            //Attempt to save the new session.  If success, return session id.
            user.$save()
            .then(
            function()
            {
                deferred.resolve(UserSession.user_check());
            },
            function()
            {
                deferred.reject("Error");
            });

            //Return the promise to resolve later.
            return deferred.promise;
        };
    
    return self;
}]);

appServices.factory('articleTemplateFactory', ['$resource', '$q', function($resource, $q)
{
    var self = {};
    
    //Article Template object
    var articleTemplate = $resource('/article_template/:id',{id:'@id'});
    
    self.getTemplates = function()
    {
        //Return the list of Authors from server
        return articleTemplate.query();
    };
    
    self.addTemplate = function(template)
    {
        //Adds a new template
        
        //Setup a defer
        var deferred = $q.defer();
        
        //Create the new author object
        var newArticleTemplate = new articleTemplate();
        
        //Set template attributes
        newArticleTemplate.name = template.name;
        
        //Set the html
        newArticleTemplate.html = template.html;
        
        //Save templater to database
        newArticleTemplate.$save()
        .then(function()
        {
            deferred.resolve();
        });
        
        return deferred.promise;
    };
    
    self.deleteTemplate = function(id)
    {
        //Deletes a template by :id from database
        
        var deferred = $q.defer();
        
        articleTemplate.delete({id:id})
        .$promise.then(function()
        {
            deferred.resolve();
        });
        
        return deferred.promise;
    };
    
    return self;
}]);