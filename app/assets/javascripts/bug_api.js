$(document).ready(function() {

    b = [4,7,8,'x'];
    function delete_numbers(arr) {
        var i = arr.length;
        var newArray = [];
        while(i--) {
                if ((arr[i] > 5) && (arr[i] < 10) && (isNaN(arr[i]) == false)) {
                }else{
                    newArray.push(arr[i])
                };
        };
        return newArray.reverse();
    }
    console.log("delete numbers: " + delete_numbers(b));

    function permutator(arr) {
        var permutations = [];
        if (arr.length === 1) {
            return [arr];
        }

        for (var i = 0; i < arr.length; i++) {
            var subPerms = permutator(arr.slice(0, i).concat(arr.slice(i + 1)));
            for (var j = 0; j < subPerms.length; j++) {
                subPerms[j].unshift(arr[i]);
                permutations.push(subPerms[j]);
            }
        }
        return permutations;
    }
    a = [4,7,8,'x'];
    console.log("permutator: " + permutator(a));

    function random() {
        var options = ['Yes','No', 'Maybe'];
        var randomNumber = Math.floor(Math.random()*options.length);
        return options[randomNumber];
    }

    function createArray(dimensions) {
        var dimensions = typeof dimensions !== 'undefined' ? dimensions : [5,5];
        var array = new Array(dimensions[0] || 0);
        var i = dimensions[0];
        if (dimensions.length > 1) {
            var args = Array.prototype.slice.call(dimensions, 1);
            while(i--) {
                array[dimensions[0]-1 - i] = createArray(args, random());
            }
        } else {
            if (typeof random() !== 'undefined') {
                while(i--) {
                    array[dimensions[0]-1 - i] = random();
                }
            }
        }

        return array;
    }


    console.log("create 5x5 array with options: " + createArray());

    function createCORSRequest(method){
        var apiKey = "380ce15c9ae5893acc678f0e3ec24a85";
        var apiId = "b782df16";
        var url = "https://www.bookingbug.com/api/v1/114784/services";
        var xhr = new XMLHttpRequest();
        if ("withCredentials" in xhr){
            // XHR has 'withCredentials' property only if it supports CORS
            xhr.open(method, url, true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.setRequestHeader('App-id', apiId);
            xhr.setRequestHeader('App-key', apiKey);
        } else if (typeof XDomainRequest != "undefined"){ // if IE use XDR
            xhr = new XDomainRequest();
            xhr.open(method, url);
        } else {
            xhr = null;
        }
        return xhr;
    }
    var request = createCORSRequest( "get" );
    if ( request ){
        // Define a callback function
        request.onload = function(){};
        // Send request
        request.send();
    }
    request.onreadystatechange=function(){
        if (request.readyState==4 && request.status==200)
        {
            var a = JSON.parse(request.responseText);
            var length = a._embedded.services.length -2;
            while (length != a._embedded.services.length){
                console.log(a._embedded.services[length]['name']);
                length++;}
        }
    };
});