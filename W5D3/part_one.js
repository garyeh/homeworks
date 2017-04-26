//Mystery Scoping with var, let, const

function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// 'in block'
// 'in block'

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// 'in block'
// 'out of block'

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// SyntaxError: Identifier 'x' has already been declared
// ReferenceError: x is not defined

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// 'in block'
// 'out of block'

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}
// SyntaxError: Identifier 'x' has already been declared
// ReferenceError: x is not defined

// madLib

const madLib = (verb, adjective, noun) => {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`
};

// isSubstring

const isSubstring = (searchString, subString) => {
  return searchString.includes(subString);
};

// fizzBuzz

const fizzBuzz = (numbers) => {
  let saved = [];
  numbers.forEach(function (num) {
    if ((num % 3) === 0 && (num % 5) === 0) {}
    else if ((num % 3) === 0 || (num % 5) === 0) {
      saved.push(num)
    }
  })
  return saved;
};

// isPrime

const isPrime = (number) => {
  if (number < 2) {
    return false;
  }
  for (let i=2; i<number; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
};

// sumOfNPrimes

const sumOfNPrimes = (n) => {
  let count = 0;
  let sum = 0;
  let i = 0;
  while (count < n) {
    if (isPrime(i)) {
      sum += i;
      count++;
    }
    i++;
  }
  return sum;
};
