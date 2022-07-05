// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract UniversityDegree is ERC721URIStorage {

    address owner;

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // This function get call once when you deploy the contract
    constructor() ERC721("UniversityDegree", "Degree") {
        owner = msg.sender;
    }

    // Record which addresses have a degree issued
    mapping(address => bool) public issueDegrees;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;      // '_' is the code of the next function
    }

    function issueDegree(address to) onlyOwner external {
        issueDegrees[to] = true;
    }

    function claimDegree(string memory tokenURI) public returns(uint256) {
        require(issueDegrees[msg.sender], "Degree is not issued");

        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);

        issueDegrees[msg.sender] = false;

        return newItemId;
    }
}