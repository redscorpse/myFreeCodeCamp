function checkCashRegister (price, cash, cid) {

	const currency = [
		["PENNY", 0.01],
		["NICKEL", 0.05],
		["DIME", 0.10],
		["QUARTER", 0.25],
		["ONE", 1.00],
		["FIVE", 5.00],
		["TEN", 10.00],
		["TWENTY", 20.00],
		["ONE HUNDRED", 100.00]];
	
	let status;
	let changeValue;
	let changeR = [];

	let cidCopy = JSON.parse(JSON.stringify(cid));  // deep copy
	// count coins
	for (let i=0; i<cidCopy.length; i++) {
		cidCopy[i].push(cidCopy[i][1]/currency[i][1]);
	};

	let mustReturn = cash - price;
	
	let cid_total = 0;
	for (let i=0; i<cid.length; i++) {
		cid_total += parseFloat(cid[i][1].toFixed(2));
	};

	status = (cid_total < mustReturn) ? "INSUFFICIENT_FUNDS" : (cid_total == mustReturn) ? "CLOSED" : "OPEN";

	changeValue = (cid_total < mustReturn) ? changeR : (cid_total == mustReturn) ? cid : changeR;
	

	// return change available on cid
	if (cid_total > mustReturn) {
		let coin;
		for (let i=currency.length-1; i>=0; i--) {
			let coinName = currency[i][0];
			let coinValue = currency[i][1];

			let countCoin = cidCopy[i][2];
			
		    if (coinValue <= mustReturn  &&  countCoin > 0) {
				let numOfCoins = Math.floor(mustReturn/coinValue) <= countCoin ? Math.floor(mustReturn/coinValue) : countCoin;
				coin = [coinName, coinValue * numOfCoins];
				changeR.push(coin);
				mustReturn -= coinValue * numOfCoins;
				mustReturn = mustReturn.toFixed(2);
				cidCopy[i][1] -= coinValue * numOfCoins;
				cidCopy[i][2] -= numOfCoins;
				cidCopy[i][1] = cidCopy[i][1].toFixed(2);
		    };
	    };
		//console.log(mustReturn);
		if (mustReturn > 0) {status="INSUFFICIENT_FUNDS"; changeValue = []};
	};
	


	let change = {"status": status, "change": changeValue};

	//console. log(change);
	return change;
};