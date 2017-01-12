exports = (typeof window === 'undefined') ? global : window;

exports.regexAnswers = {
  containsNumber : function(str) {
    return (
    /\d/.test(
      str));

  },

  containsRepeatingLetter : function(str) {
  return  (/([a-z])\1/i).test(str);

  },

  endsWithVowel : function(str) {
     return ['a', 'e', 'i', 'o', 'u'].indexOf((str.slice(-1)).toLowerCase()) !== -1
  },

  captureThreeNumbers : function(str) {
       var num = str.match(/[0-9]+/g);
       if (!num || num[0].length < 3) {
         return false;
       }

       else {return (num[0]).substring(0, 3);}
  },

  matchesPattern : function(str) {
    var arr = str.split("-");
    if (arr[0].length === 3 && arr[1].length === 3 && arr[2].length === 4 && str[0] != "a") {
      var res = true;
    }
    else {var res = false;}
    return res;

  },

  isUSD : function(str) {
    var decimals = str.split(".")
    if (str[0] === "$" && (decimals[1] == null || decimals[1].length === 2)){
      var pattern = /^\$?(\d{1,3}(\,\d{3})*|(\d+))(\.\d{0,2})?$/;
     return pattern.test(str);
    }
    else {
      return false;
    }




  }
};
