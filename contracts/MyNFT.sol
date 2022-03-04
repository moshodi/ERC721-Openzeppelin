//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyNFT is ERC721 {
    uint256 private _tokenId = 0;

    constructor(
        string memory _name,
        string memory _symbol
    ) ERC721(_name, _symbol) public {
    }

    function mintToAddress(address _to) public {
        uint256 newTokenId = _tokenId + 1;
        _mint(_to, newTokenId);
        _tokenId++;
    }

}
