//UserLoginCtr
myApp.controller("UserLoginCtr", ['$scope', 'Auth','$location', function($scope,Auth,$location) {

    $scope.user={};

    $scope.login = function (){

       var credentials = {
            email:  $scope.user.email,
            password:  $scope.user.password
        };
        var config = {
            headers: {
                'X-HTTP-Method-Override': 'POST'
            }
        };

        Auth.login(credentials, config).then(function(user) {
            console.log(user); // => {id: 1, ect: '...'}
        }, function(error) {
            // Authentication failed...
            alert("Invalid email or password.");
        });

        $scope.$on('devise:login', function(event, currentUser) {
            // after a login, a hard refresh, a new tab
            $scope.user={};
            $location.path('/store');
        });

        $scope.$on('devise:new-session', function(event, currentUser) {
            // user logged in by Auth.login({...})
        });


    };

}]);


//UserRegisterCtr
myApp.controller("UserRegisterCtr", ['$scope', 'Auth','$location', function($scope,Auth,$location) {

     $scope.user={};


  $scope.register = function (){
  var credentials = {
            email:  $scope.user.email,
            password:  $scope.user.password,
            password_confirmation: $scope.user.cpassword
        };
        var config = {
            headers: {
                'X-HTTP-Method-Override': 'POST'
            }
        };

        Auth.register(credentials, config).then(function(registeredUser) {
            console.log(registeredUser);
            Auth.login(credentials, config);
            $location.path('/store');
        }, function(error) {
            // Registration failed...

          //  $scope.errors.push(error);
          if(error.data.errors.email){
            alert('Email Alerdy Taken...');
          }else if(error.data.errors.password_confirmation){
          alert(error.data.errors.password_confirmation);
          }else if(error.data.errors.password){
          alert('is too short (minimum is 8 characters)');
          }



        });

        $scope.$on('devise:new-registration', function(event, user) {
            // ...
        });

}

}]);
