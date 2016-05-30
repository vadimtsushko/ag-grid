/**
 * Created by Tsushko on 26.05.2016.
 */
var dartInterface = {};

function getDartInterface() {
  return dartInterface;
}



// function setupDartInterface(_dartInterace) {
//     dartInterface = _dartInterace;
// }
//
// var __Class = function(methods) {
//     var klass = function() {
//         console.log('In User initialize');
//         this.initialize.apply(this, arguments);
//         console.log('After User initialize');
//     };
//
//     for (var property in methods) {
//         klass.prototype[property] = methods[property];
//     }
//
//     if (!klass.prototype.initialize) klass.prototype.initialize = function(){};
//
//     return klass;
// };
//
// function createClass(className, methods)
// {
//     dartInterface[className] = new __Class(methods)
//     console.log('dartInterface',dartInterface)
// }
//
// function assignNumericCellEditor (colDef) {
//     colDef.cellEditor = dartInterface.NumericCellEditor;
// }
