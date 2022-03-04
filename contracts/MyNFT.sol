//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "base64-sol/base64.sol";


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

        /**
     * @dev return tokenURI, image SVG data in it.
     */

     function tokenURI(uint256 tokenId) override public pure returns (string memory) {
        string[17] memory parts;
        parts[0] = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="black" /><text x="10" y="20" class="base">';

        parts[1] = Strings.toString(tokenId);

        parts[2] = '</text></svg>';

        string memory output = string(abi.encodePacked(parts[0], parts[1], parts[2]));

        string memory json = Base64.encode(bytes(string(abi.encodePacked('{"name": "Badge #', Strings.toString(tokenId), '", "description": "A concise Hardhat tutorial Badge NFT with on-chain SVG images like look.", "image": "data:image/svg+xml;base64,', Base64.encode(bytes(output)), '"}'))));
        output = string(abi.encodePacked('data:application/json;base64,', json));

        return output;
    }



}
