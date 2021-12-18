pragma solidity ^0.8.0;

import "./House.sol";

contract RealEstateContract {
    House houseNFT;
    constructor(House _houseNFT) public {
        houseNFT = _houseNFT;
    }

    function addNewHouse(string memory URI) public returns(uint){
        uint houseId = houseNFT.addHouse(msg.sender, URI);
        return houseId;
    }

    function getOwnerOfHouse(uint _houseId) public view returns(address) {
        return houseNFT.ownerOf(_houseId);
    } 
}