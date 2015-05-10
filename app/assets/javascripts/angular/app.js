angular.module('flapperNews', ['templates'])
.controller('MainCtrl', [
'$scope',
function($scope){
  $scope.test = 'Hello world!';
}]);