// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.10;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyNFT is ERC721{
    uint256 private _tokenId;
    constructor() ERC721("VEGA NFT","VEGA"){}

    function mint(address to) public returns(uint256){
        uint256 newId = ++_tokenId;
        _mint(to,newId);
        return newId;
    }
}

//cid:bafkreicr42nnwai4rnxpmf3my5efqjpyxk4gdyywtpwx3rsdin5ihm2b2u