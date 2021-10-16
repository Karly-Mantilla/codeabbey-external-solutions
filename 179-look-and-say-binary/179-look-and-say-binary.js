var binString = input();

var numParents = findParents(binString);
var numSteps = findSteps(binString);

output(numSteps + ' ' + numParents.toFixed());

function findSteps(childString){
    var stepCount = 0;
    while (binString != "10"){
        binString = reduceString(binString);
        ++stepCount;
        }
    return stepCount;
}

function findParents(childString){
    var ones = childString.split("").map(function(x){if (x == 1) return 1;}).join("");
    return Math.pow(2, ones.length - 1);
}

function reduceString(origString){
    
    var origSplit = origString.split("");

    var digitCounts = [0];
    var numProcessed = 0;
    var digitCountInd = 0;
    var valInProcess = 1;
    
    while(numProcessed < origSplit.length){

    if (origSplit[numProcessed] == valInProcess){
        digitCounts[digitCountInd] += 1;        
    } else
    {
        digitCountInd++;
        digitCounts[digitCountInd] = 1;
        (valInProcess == 1 ? valInProcess = 0: valInProcess = 1);
    }
    
    numProcessed += 1;
    }

    digitCounts = digitCounts.map(function(x){return x.toString(2)});
    return digitCounts.join("");
    
}