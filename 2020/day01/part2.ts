import * as fs from 'fs';

const file = fs.readFileSync('part1.txt', 'utf-8');
var values: number[] = file.split('\n').map(function (item) { return parseInt(item); })

values.forEach(element => {
	values.forEach (element2 => {
		if (element == element2)
			return ;
		var found: number = values.find(it => it == (2020 - element - element2));
		if (found) {
			console.log(element * element2 * found);
			process.exit();
		}
	})
});