function telephoneCheck(str) {
  let regex = /^1?\s*(\d{3}|\(\d{3}\))(\s|-)*\d{3}(\s|-)*\d{4}$/g;
  
  return regex.test(str);
}

/*
console.log('TRUE');
console.log( telephoneCheck("555-555-5555") );
console.log( telephoneCheck("(555)555-5555") );
console.log( telephoneCheck("555 555-5555") );
console.log( telephoneCheck("555 555 5555") );
console.log( telephoneCheck("5555555555") );
console.log( telephoneCheck("1 555 555 5555") );

console.log('FALSE')
console.log( telephoneCheck("(6054756961)") );
console.log( telephoneCheck("2 (757) 622-7382") );
console.log( telephoneCheck("0 (757) 622-7382") );
console.log( telephoneCheck("-1 (757) 622-7382") );
console.log( telephoneCheck("2 757 622-7382") );
console.log( telephoneCheck("10 (757) 622-7382") );
console.log( telephoneCheck("27576227382") );
console.log( telephoneCheck("(275)76227382") );
console.log( telephoneCheck("2(757)6227382") );
console.log( telephoneCheck("2(757)622-7382") );
console.log( telephoneCheck("(555-555-5555") );
console.log( telephoneCheck("11 555-555-5555") );
*/