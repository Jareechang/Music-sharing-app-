//This is the defining the module 
angular.module('flapperNews', ['templates', 'ngResource'])

// ************* Start of factory ***********************

.factory('Tracks', ['$resource', function ($resource) {
    return $resource('/tracks', {text: 'edsheeran'}, {
        query: { method: 'GET', isArray: true }
    })
}])

// ************* end of factory **************************


// ************* start of main controller ***************

.controller('MainCtrl', [
'$scope', 'Tracks',
function($scope, Tracks){
  // grabs the element to append to 
  
  // Use the Angular factory to get the tracks from the back-end

  Tracks.query().$promise.then(function(data){
    angular.element(document).ready(function(){
    var targetElement = angular.element(document.querySelector('#testing'));
    // targetElement.append('This totally works');
      for(var i in data){
        targetElement.append(data[i]);
      } 
    })
  })

}]);

// ************* end of main controller ***************
