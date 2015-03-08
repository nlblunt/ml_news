var appServices = angular.module('appServices', ['ngResource', 'angularFileUpload']);

appServices.factory('authorFactory', ['$resource', '$q', function($resource, $q)
{
    var self = {};
    
    //Author object
    var Author = $resource('/author/:id',{id:'@id'});
    
    self.getAuthors = function()
    {
        //Return the list of Authors from server
        return Author.query();
    };
    
    self.addAuthor = function(author)
    {
        //Adds a new author
        
        //Setup a defer
        var deferred = $q.defer();
        
        //Create the new author object
        var newAuthor = new Author();
        
        //Set author attributes
        newAuthor.name = author.name;
        
        //Save author to database
        newAuthor.$save()
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
    
    return self;
}]);