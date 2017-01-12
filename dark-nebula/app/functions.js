exports = (typeof window === 'undefined') ? global : window;

exports.functionsAnswers = {
  isPrime : function(num) {
    for(var i=2; i<= Math.sqrt(num); i++){
      if(num%i ==0){
        return false;
      }
    }
    return true;
  },

  arraySum : function(array) {
    for (
   var
     index = 0,              // The iterator
     length = array.length,  // Cache the array length
     sum = 0;                // The total amount
     index < length;         // The "for"-loop condition
     sum += array[index++]   // Add number on each iteration
 );
 return sum;

  },

  fizzBuzz : function(num) {
    if (isNaN(num)) {
      return false;}

    else if (num % 3 === 0 && num % 5 === 0)
      {return "fizzbuzz";}

    else if (num % 3 === 0) {
      return "fizz";}

    else if (num % 5 === 0) {
      return "buzz";}


    else {return num;}


    // write a function that receives a number as its argument;
    // if the number is divisible by 3, the function should return 'fizz';
    // if the number is divisible by 5, the function should return 'buzz';
    // if the number is divisible by 3 and 5, the function should return
    // 'fizzbuzz';
    //
    // otherwise the function should return the number, or false if no number
    // was provided or the value provided is not a number
  }
};
