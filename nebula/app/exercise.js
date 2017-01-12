exports = (typeof window === 'undefined') ? global : window;

/**
 * This file defines an object with some methods. Some of these methods are
 * populated incorrectly; your job is to fix them. Other methods are not
 * populated at all; your job is to fill them out.
 */

exports.eveningExerciseAnswers = {
  indexOf : function(arr, item) {
    return arr.indexOf(item);
  },

  sum : function(arr) {
    sum= arr.reduce(function (a, b) {return a + b;}, 0);
    return sum
  },

  remove : function(arr, item) {
    return arr.filter(function(element){
        return element !== item;
    });
  },

  reverseString : function(str) {
    return str.split('').reverse().join('');
  },

  longestSubString : function(str) {
    var str = str.split(" ");
    var longest = 0;
    var word = null;
    str.forEach(function(str) {
        if (longest < str.length) {
            longest = str.length;
            word = str;
        }
    });
    return word;

  },

  letterMoveForward : function(str) {
    var result = "";
 for (var i = 0; i < str.length; i++) {
     // handle "z"
     if (122 == str.charCodeAt(i)) {
         result += "a";
     // handle "Z"
     } else if (90 == str.charCodeAt(i)) {
         result += "A";
     // handle all other letter characters
     } else if ((65 <= str.charCodeAt(i) && str.charCodeAt(i) <= 89) ||
                (97 <= str.charCodeAt(i) && str.charCodeAt(i) <= 121)) {
         result += String.fromCharCode(str.charCodeAt(i) + 1);
     // append all other characters unchanged
     } else {
         result += str.charAt(i);
     }
 }
 return result;

  },

  capitalizeWords : function(str) {
     return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});

  }
};
