exports = (typeof window === 'undefined') ? global : window;

/**
 * This file defines an object with some methods. Some of these methods are
 * populated incorrectly; your job is to fix them. Other methods are not
 * populated at all; your job is to fill them out.
 */

exports.bestPracticesAnswers = {
  globals : function() {
    var myObject = {
      name : 'Jory'
    };

    return myObject;
  },

  functions : function(flag) {
    if (flag) {
      function getValue() { return 'a'; }
    } else {
      function getValue() { return 'b'; }
    }

    return getValue();
  },

  parseInt : function(num) {
    if (num[0] === "0")
      {return 0;}
    else {var result = parseInt(num);
    return result;}
  },

  identity : function(val1, val2) {
    if (Number.isInteger(val1) && Number.isInteger(val2)) {
      return true;}
    else {return false;}
  }
};
