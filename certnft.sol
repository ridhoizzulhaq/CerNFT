// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.1/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.8.1/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyToken is ERC721, Ownable {
     using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
   
    constructor() ERC721("CerNFT", "CertNFT") {}
  struct Certificate {
        address owner;
        string achievementName;
        string achievementDescription;
        string dateAchieved;
     
        
    }
    mapping (uint256 => Certificate) public certificates;
    
    //function to to mint certificate
    function issueCertificate(string memory _achievementName, string memory _achievementDescription, string memory _dateAchieved) public {
       uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        certificates[tokenId] = Certificate(msg.sender, _achievementName, _achievementDescription, _dateAchieved);
        _mint(msg.sender, tokenId); }

     //function for get certificate info
    function getCertificateInfo(uint256 tokenId) public view returns (address, string memory, string memory, string memory) {
       require(_exists(tokenId), "Token tidak ditemukan");
        return (certificates[tokenId].owner, certificates[tokenId].achievementName, certificates[tokenId].achievementDescription, certificates[tokenId].dateAchieved); }
    
}