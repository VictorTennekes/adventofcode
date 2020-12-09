import * as fs from 'fs';

const file = fs.readFileSync('part1.txt', 'utf-8');
var values: number[] = file.split('\n').map(function (item) { return parseInt(item); })

values.forEach(element => {
	var found: number = values.find(it => it == (2020 - element));
	if (found) {
		console.log(element * found);
		process.exit();
	}
});