// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract FinkiNFT is ERC721Enumerable, Ownable {

    string private _baseTokenURI;

    constructor() ERC721("Finki NFT","FINKI") {
        setBaseURI("https://gateway.pinata.cloud/ipfs/QmYTqn8t6GyxJ8SSjerRfLV1AA1HEUezcSxR18V4vwEv7d/");
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        return string(abi.encodePacked(_baseTokenURI, Strings.toString(_tokenId)));
    }

    function setBaseURI(string memory baseURI) public onlyOwner {
        _baseTokenURI = baseURI;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    function mint() public {
        uint256 totalSupply = totalSupply();
        _safeMint(msg.sender, totalSupply + 1);
    }

}