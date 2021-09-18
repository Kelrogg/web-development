function isMyOperand(symbol) {
  return symbol === '*' || symbol === '-' || symbol === '/' || symbol === '+';
}

function isDigit(symbol) {
  return /\d/.test(symbol);
}

function toDigit(symbol) {
  switch (symbol){
      case '0': return 0;
      case '1': return 1;
      case '2': return 2;
      case '3': return 3;
      case '4': return 4;
      case '5': return 5;
      case '6': return 6;
      case '7': return 7;
      case '8': return 8;
      case '9': return 9;
      default : return -1;
  }
}

function calc(s) {
  let Arr = [];
  let Number = 0, isNumber = false, multiplier = 1, Brackets = 0;
  for (let index = s.length - 1; index >= 0; --index) {

      if (Brackets < 0) return 'error in quantity of brackets';

      if (isDigit(s[index])) {
          Number += toDigit(s[index]) * multiplier;
          multiplier *= 10;
          isNumber = true;
          continue;
      }
      if (isNumber) {
          Arr.push(Number);
          multiplier = 1;
          Number = 0;
          isNumber = false;
      }

      if (/\s/.test(s[index])) {
          while (index && /\s/.test(s[index-1])) --index;
          continue;
      }

      if (isMyOperand(s[index])) {
          switch(s[index]) {
              case '*':
                  
                  Arr.push(Arr.pop() * Arr.pop());
                  break;
              case '/':

                  Arr.push(Arr.pop() / Arr.pop());
                  break;
              case '-':

                  Arr.push(Arr.pop() - Arr.pop());
                  break;
              case '+':

                  Arr.push(Arr.pop() + Arr.pop());
                  break;
          }
          continue;
      }

      if (s[index] === '(') {
          --Brackets;
          continue;
      }

      if (s[index] === ')') {
          ++Brackets;
          continue;
      }

      console.log('error in', index, 'symbol');
      return 0;
  }
  if (Brackets) return 'error in quantity of brackets';
  if (Arr.length !== 1) return 'lack of operators for operands';
  if (!Brackets) console.log(Arr[0]);
  return 'Ok';
}

console.log(calc("- * / 15 - 7 (+ 1 1) 3 + 2 + 1 1"));
console.log(calc("- * / 15 - 7 (+ 1 1) 3) + 2 + 1 1"));
console.log(calc("(("));
console.log(calc("()"));
console.log(calc("(1)"));
console.log(calc("+ 5 / 5 5"));