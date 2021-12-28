const fs = require('fs');
const realEstateContract = JSON.parse(fs.readFileSync('./build/contracts/RealEstateContract.json', 'utf8'));
const houseContract = JSON.parse(fs.readFileSync('./build/contracts/House.json', 'utf8'));
console.log(JSON.stringify(realEstateContract.abi))