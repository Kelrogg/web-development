function forArray(arr) {
  for (let value in arr) {
      if (!isNaN(arr[value])) {
          let isPrime = true

          for (let i = 2; i <= Math.sqrt(arr[value]); ++i) {
              if (arr[value] % i === 0) isPrime = false
          }

          if (isPrime) console.log(arr[value], 'is prime number')
          if (!isPrime) console.log(arr[value], 'is not prime number')
      }
      if (isNaN(arr[value])) {
          console.log(arr[value], 'is not number')
      }
  }
  return;
}

function forSingle(arr) {
  let isPrime = true
  for (let i = 2; i <= Math.sqrt(arr); ++i) if (arr % i === 0) isPrime = false;

  if (isPrime) console.log('is prime number');
  if (!isPrime) console.log('is not prime number');
}

function isPrimeNumber(arr) {
  if (Array.isArray(arr)) forArray(arr);
  else {
      if (isNaN(arr)) console.log('is not number');
      if (!isNaN(arr)) forSingle(arr);
  }
}
isPrimeNumber('f')
isPrimeNumber(101)
isPrimeNumber([3,4,5,15,36,60])
isPrimeNumber([3,4,5,'F',60])

isPrimeNumber()