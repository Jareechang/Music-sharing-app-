//This is the defining the module 
angular.module('flapperNews', ['templates', 'ngResource'])

// ************* Start of factory ***********************

.factory('Tracks', ['$resource', function ($resource) {
    return $resource('/tracks', {text: 'lanadelrey'}, {
        query: { method: 'GET', isArray: true }
    })
}])

// ************* end of factory **************************


// ************* start of main controller ***************

.controller('MainCtrl', [
'$scope', 'Tracks',
function($scope, Tracks){
  $scope.test = 'Hello world!';
  console.log(Tracks.query());
}]);

// ************* end of main controller ***************
