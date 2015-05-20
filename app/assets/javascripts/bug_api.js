$(document).ready(function() {
    a = [4,7,8,'x'];
    b = [4,7,8,'x'];
    function delete_numbers(arr) {
        var i = arr.length;
        var newArray = [];
        while(i--) {
                if (arr[i] > 5 && (arr[i] < 10) && (isNaN(arr[i]) == false)) {
                    console.log(arr[i]);
                }else{
                    newArray.push(arr[i])
                };
        };
        return newArray.reverse();
    }

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
    console.log("permutator: " + permutator(a));
    console.log("delete numbers: " + delete_numbers(b));
    console.log("create 5x5 array with options: " + createArray());
});