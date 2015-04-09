var appServices = angular.module('appServices', ['ngResource', 'angularFileUpload']);

appServices.factory('articleFactory',['$resource', '$q', '$http', '$upload', function($resource, $q, $http, $upload)
{
    var self = {};
    
    var Article = $resource('/article/:id', {id: '@id'},
    {
        //Custom API
        getMajorArticles: {method:'GET', url:'/article/getMajorArticles', isArray:true},
        getMinorArticles: {method:'GET', url:'/article/getMinorArticles', isArray:true}
    });
    
    self.addArticle = function(data, author)
    {
        $upload.upload({
            url: '/article',
            fields: {'article[title]': data.title, 'article[body]': data.body, 'article[category_id]': data.category,
                     'article[caption]': data.caption, 'article[author_id]': author.id, 'article[major]': data.major},
            file: data.display_img,
            fileFormDataName: 'article[display_img]'
        });
        
        return;
    };
    
    self.getMajorArticles = function()
    {
        return Article.getMajorArticles();
    };
    
    self.getMinorArticles = function()
    {
        return Article.getMinorArticles();
    };
    
    return self;
}]);


appServices.factory('authorFactory', ['$resource', '$q', '$http', function($resource, $q, $http)
{
    var self = {};
    
    //Author object
    var Author = $resource('/author/:id',{id:'@id'});
    
    //Author (User) seesion object
    var UserSession = $resource('/users/sign_in', {id: '@id'},
    {
            //Customer API to check admin session.
            userCheck: {method:'GET', url:'/users/user_check'}
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
    
    self.authorCheck = function()
    {
        //Check with the server if user is logged in.  Returns session ID.
        return UserSession.userCheck();
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
            function(author)
            {
                deferred.resolve(author);
            },
            function()
            {
                deferred.reject("Error");
            });

            //Return the promise to resolve later.
            return deferred.promise;
        };
    
    self.authorLogOut = function(authorId)
    {
        var author = $resource('/users/sign_out');

        author.delete({id: authorId});

        return self;
    };

    return self;
}]);
