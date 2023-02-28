/* How to convert decimal number to roman numerals:
1. Find the highest decimal value in the table (v) that is less than or equal to the decimal number you want to convert (x).
2. Write the roman numeral (n) that you found and subtract its value (v) from (x): x=x-v
3. Repeat stages 1 and 2 until you get zero result of (x). */


function convertToRoman(num) {
	const roman = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];
	const decimal = [1000, 900, 500, 400, 100, 90, 50,40, 10, 9, 5, 4, 1];
	let romNum = "";

	for (let n=0; n<decimal.length; n++) {
		while (decimal[n] <= num) {
			romNum += roman[n];
			num -= decimal[n];
		}
	}
	return romNum;
}

console.log(convertToRoman(2014));