function palindrome(str) {
  str=str.toLowerCase();
  str=str.replace(/[^a-z0-9]/g,'');
  let l = (str.length -1);
  for (let i=0; i<(l/2); i++) {
    if (str[i] != str[l-i]) {
      return false;
      break;
    };
    //console.log(str[i], str[l-i]);
  };
  return true;
};

console.log( palindrome("almostomla") );