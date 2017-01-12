exports = (typeof window === 'undefined') ? global : window;

exports.arraysAnswers = {

  removeWithoutCopy : function(arr, item) {
    var index = 0;
   while(index < arr.length)
   {
       if(arr[index] == item)
       {
           arr.splice(index, 1);
           index = 0;
       }
       else
       {
           ++index;
       }
   }
   return arr;
  },

  append : function(arr, item) {
    arr.push(item);
    return arr;

  },

  truncate : function(arr) {
    arr.pop();
    return arr;

  },

  prepend : function(arr, item) {
    arr.unshift(item);
    return arr;

  },

  curtail : function(arr) {
    arr.splice(0, 1);
    return arr;

  },

  concat : function(arr1, arr2) {
    return arr1.concat(arr2)

  },

  insert : function(arr, item, index) {
    arr.splice(index,0,item);
    return arr;
  },

  count : function(arr, item) {
    var count = 0;
    var index = 0;
   while(index < arr.length)
   {
       if(arr[index] == item)
       {
           ++count;
          ++index;
       }
       else
       {
           ++index;
       }
   }
   return count

  },

  duplicates : function(arr) {
    var len=arr.length,
     out=[],
     counts={};

 for (var i=0; i<len; i++) {
   var item = arr[i];
   counts[item] = counts[item] >= 1 ? counts[item] + 1 : 1;
   if (counts[item] === 2) {
     out.push(item);
   }
 }

 return out;

  },

  square : function(arr) {
    return arr.map(function (x) {
     return Math.pow(x, 2);
   });

  },

  findAllOccurrences : function(arr, target) {
    var indexes = [], i;
   for(i = 0; i < arr.length; i++)
       if (arr[i] === target)
           indexes.push(i);
   return indexes;

  }
};
