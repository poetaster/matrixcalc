var calculated_result = 0;
var current_operation = 'null';
var buffered_result = 0;
var pressedEqual = false;
var inputDegree = false;
var underDegree = 0;
var isDot = false;
var afterDot = 0;
var memory = 0;
var actionButtonPressed = false;
var alreadySavedResult = false;
var valuePrinted = false;

function parseValue(value){
    var length = value.length;
    var array = value.slice();
    var result = 0;
    for(var i = length-1, j = 0;i>=0;i--){
        if(array[i]!=="=")
            result += array[i]*Math.pow(10,(length-1-i));
        else break;
    }
    return result;
}

function clearHistory(){
    countOfOperations = 0;
    history = [];
}

function addToHistory(symbol){
    if(history[countOfOperations] === undefined)
        history.push(symbol.toString());
    else
        history[countOfOperations] += symbol.toString();
}

function degree(){
    inputDegree = true;
    underDegree = calculated_result;
    calculated_result = 0;
    isSimpleView = true;
    calculated();
}

//parse and do momental math operation with single number
function numberOperation(text){
    alreadySavedResult = true;
    switch(text){
    case 'pow':
        addToHistory(underDegree);
        addToHistory("^");
        addToHistory(calculated_result)
        calculated_result = Math.pow(underDegree, calculated_result);
        underDegree = 0;
        break;
    case 'percent':
        addToHistory(calculated_result);
        addToHistory("%");
        calculated_result = (calculated_result/100)*buffered_result;
        break;
    case 'log':
        addToHistory(text);
        addToHistory("("+calculated_result+")");
        calculated_result = Math.log(calculated_result);
        break;
    case 'e':
        addToHistory(text);
        calculated_result = Math.E;
        break;
    case 'pi':
        addToHistory(text);
        calculated_result = Math.PI;
        break;
    case 'exp':
        addToHistory(text);
        addToHistory("("+calculated_result+")");
        calculated_result = Math.exp(calculated_result);
        break;
    case 'factorial':
        addToHistory(calculated_result);
        addToHistory("!");
        calculated_result = factorial(calculated_result);
        break;
    case 'sqrt':
        addToHistory(text);
        addToHistory("("+calculated_result+")");
        calculated_result = Math.sqrt(calculated_result);
        break;
    case 'abs':
        addToHistory("|"+calculated_result+"|");
        calculated_result = Math.abs(calculated_result);
        break;
    case 'tan':
        addToHistory(text);
        addToHistory(calculated_result);
        calculated_result = Math.tan(calculated_result);
        break;
    case 'cos':
        addToHistory(text);
        addToHistory(calculated_result);
        calculated_result = Math.cos(calculated_result);
        break;
    case 'sin':
        addToHistory(text);
        addToHistory(calculated_result);
        calculated_result = Math.sin(calculated_result);
        break;
    }
    calculated();
}

function factorial(num){
    var result = 1;
    if(calculated_result == 0)
        return 0;
    if(isInt(num))
        for(var i = 1;i<=num;i++)
            result*=i;
    return result;
}

function isInt(number){
    if(number-parseInt(number)==0)
        return true;
    return false;
}

function plusMinus(){
    calculated_result*=-1;
    calculated();
}

function memShow(){
    result.text = memory.toString()+"M";
}

function memMIN(){
    memory-=calculated_result;
}

function memPLS(){
    memory+=calculated_result;
}

function memClear(){
    memory = parseInt(memory/10);
}

function memRemowe(){
    memory = 0;
}

function showBuffer(){
    buffer.text = "= "+buffered_result.toString();
}

//prepare result to print on display
function calculated(){
    if(value!==0&&value!==undefined&&(calculated_result!==value)){
        calculated_result = value;
    }
    if(current_operation!="null"){
        if((isDot==true)&&(afterDot==0))
            return result.text = current_operation.toString()+calculated_result.toString()+".";
        else
            return result.text = current_operation.toString()+calculated_result.toString();
    }
    else{
        if((isDot==true)&&(afterDot==0))
            return result.text = calculated_result.toString()+".";
        else
            return result.text = calculated_result.toString();
    }
}

function dot(){
    isDot = true;
    calculated();
}

//parse and do math operation
function parseOperation(text){
    if(inputDegree == true){
        numberOperation('pow');
        inputDegree = false;
    }
    switch(current_operation){
    case '+':
        calculated_result = buffered_result+calculated_result;
        break;
    case '-':
        calculated_result = buffered_result - calculated_result;
        break;
    case '*':
        calculated_result = buffered_result*calculated_result;
        break;
    case '/':
        calculated_result = buffered_result/calculated_result;
        break;
    case '=':
        buffered_result = 0;
        calculated();
        return;
    }
    buffered_result = 0;
    current_operation = text;
}

//determines which math operation to perform and then places calculated_result to buffered_result
function doOperation(text){
    isDot = false;
    afterDot = 0;
    valuePrinted = false;
    if(alreadySavedResult==true)
        alreadySavedResult=false;
    else
        addToHistory(calculated_result);
    if(current_operation == 'null'){
        addToHistory(text);
        current_operation = text;
        if(inputDegree == true){
            numberOperation('pow');
            inputDegree = false;
        }
        if(current_operation == '='){
            doIfEqualPressed(text);
            return;
        }
    }
    else{
        addToHistory(text);
        parseOperation(text);
        if(current_operation == '='){
            doIfEqualPressed(text);
            return;
        }
    }
    buffered_result = calculated_result;
    calculated_result = 0;
    showBuffer();
    calculated();
}

function doIfEqualPressed(text){
    if(inputDegree == true){
        numberOperation('pow');
        inputDegree = false;
    }
    pressedEqual = true;
    parseOperation('=');
    addToHistory(calculated_result);
    countOfOperations++;
    current_operation = 'null';
    showBuffer();
}

//backspace
function del(){
    calculated_result = parseInt(calculated_result/10);
    calculated();
}

//Delete all results of work in calculator
function ac(){
    calculated_result = 0;
    buffered_result = 0;
    current_operation = 'null';
    underDegree = 0;
    pressedEqual = false;
    inputDegree = false;
    valuePrinted = false;
    isDot = false;
    afterDot = 0;
    showBuffer();
    calculated();
}

//Input numbers to calculated_result by buttons with numbers from 0 to 9
function inputNum(text){
    if(pressedEqual == false){
        if(isDot == false)
            calculated_result = calculated_result*10+parseInt(text);
        else{
            afterDot++;
            calculated_result+=(parseInt(text)/Math.pow(10,afterDot));
        }
    }
    else{
        calculated_result = parseInt(text);
        pressedEqual = false;
    }
    calculated();
}
