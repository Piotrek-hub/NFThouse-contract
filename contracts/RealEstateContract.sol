pragma solidity ^0.8.0;

import "./House.sol";

contract RealEstateContract {
    House houseNFT;

    struct house {
        uint id;
        uint price;
        address owner;
        bool isForSale;
    }

    struct User {
        uint soldHouses;
        uint boughtHouses;
        uint totalMoneySpend;
        house[] houses;
    }

    mapping(address => User) public addressToUser;
    mapping(uint => house) public houseIdToHouse;


    constructor(House _houseNFT) public {
        houseNFT = _houseNFT;
    }

    // Function that creates nft 
    function addNewHouse(uint _price, string memory _URI) public {
        // Minting house
        uint houseId = houseNFT.addHouse(address(this), _URI);

        // Adding house object to user
        addressToUser[msg.sender].houses.push(house(houseId, _price, msg.sender, true));

        // Assing house id to house (mapping)
        houseIdToHouse[houseId] = house(houseId, _price, msg.sender, true);


    }

    function buyHouse(uint _houseId) public payable{
        address previousHomeOwner = houseIdToHouse[_houseId].owner;
        // Check if buyer send enough eth
        require(
            msg.value == houseIdToHouse[_houseId].price * (1 ether),
            "Unvalid amount of money"
            );

        // Transfer house from contract address to buyer
        houseNFT.safeTransferFrom(
            address(this),
            msg.sender,
            _houseId
        );

        // Change house ownership
        house memory hs;

        // Remove house from previous owner
        for(uint i = 0; i < addressToUser[previousHomeOwner].houses.length; i++) {
            if( _houseId == addressToUser[previousHomeOwner].houses[i].id ) {
                hs = addressToUser[previousHomeOwner].houses[i];
                hs.owner = msg.sender;
                delete addressToUser[previousHomeOwner].houses[i];
            }
        }
        // Add house to new owner
        addressToUser[msg.sender].houses.push(hs);

        // Transfer money from previousHomeOwner to new owner
        payable(previousHomeOwner).transfer(msg.value);

        // Update mapping 
        houseIdToHouse[_houseId] = hs;
    }

}