function rot13(str) {
	const alph = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	let rot13 = "";
	let i = alph.length-1;
	for (let l=0; l<=i; l++) {
		l+12<i ? rot13+=alph[l+12+1] : l+12>i ? rot13+=alph[l+12-i] : rot13+=alph[0];
	};

	const cipher = {}
	for (let l=0; l<=i; l++) {
		cipher[alph[l]] = rot13[l]; 
	};
	
	let decipher = ''
	for (let l=0; l<str.length; l++) {
		let regex = /[A-Z]/g;
		decipher += str[l].replace(regex, cipher[str[l]]);
	}
	return decipher;
}

console.log( rot13("SERR PBQR PNZC") );