// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract MinterTest is ERC721, ERC721Enumerable, ERC721URIStorage {
    using SafeMath for uint256;

    uint public constant mintPrice = 0;

    constructor() ERC721("TestMinter", "TMNT") {}

    function mint(string memory uri) public payable {
        uint256 mintIndex = totalSupply(); // Total stored nfts
        _safeMint(msg.sender, mintIndex);
        _setTokenURI(mintIndex, uri);
    }

    function getAllTokens() external view returns (uint256[] memory) {
        uint256 total = totalSupply(); // Total stored nfts
        uint256[] memory ids = new uint256[](total);
        for (uint256 i = 0; i < total; i++) {
            ids[i] = tokenByIndex(i);
        }
        return ids;
    }

    function getAllTokenURIs() external view returns (string[] memory) {
        uint256 total = totalSupply(); // Total stored nfts
        string[] memory uris = new string[](total);
        for (uint256 i = 0; i < total; i++) {
            uris[i] = tokenURI(i);
        }
        return uris;
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 firstTokenId,
        uint256 batchSize
    ) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, firstTokenId, batchSize);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }
}
