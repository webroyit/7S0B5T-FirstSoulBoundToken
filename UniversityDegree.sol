// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract UniversityDegree is ERC721URIStorage {

    using Counters for Counters.Counter;

    // This function get call once when you deploy the contract
    constructor() ERC721("UniversityDegree", "Degree") {

    }

    // Record which addresses have a degree issued
    mapping(address => bool) public issueDegrees;

    function issueDegree(address to) external {
        issueDegrees[to] = true;
    }
}