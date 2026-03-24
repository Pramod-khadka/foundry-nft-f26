// SPDX-License-Identifier: MIT


pragma solidity ^0.8.18;


import  {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {
    uint256 private s_tokenCounter; // state variable to keep track of token IDs
   string private s_sadSvgImageUri; // store on-chain SVG images
   string private s_happySvgImageUri;

error MoodNFT_CantflipMoodIfNotOwner(); // custom error to handle unauthorized mood flipping
   enum Mood { // defines possible states of each Nft

       SAD,
       HAPPY
   }
mapping(uint256 => Mood) private s_tokenIdToMood; // mapping to associate each token ID with its corresponding mood (sad or happy)

   constructor(
       string memory sadSvgImageUri,
       string memory happySvgImageUri
   ) ERC721("MoodNft","ZP") {
       s_tokenCounter = 0;
        s_sadSvgImageUri = sadSvgImageUri;
        s_happySvgImageUri = happySvgImageUri;
    }

      function mintNft() external{
           
            _safeMint(msg.sender, s_tokenCounter); // mint the new token to the caller of the function, using the current value of s_tokenCounter as the token ID.
             s_tokenIdToMood[s_tokenCounter] = Mood.SAD; // when a new NFT is minted, it is assigned the SAD mood by default in the mapping.
            s_tokenCounter++; // increment the token counter for the next minting.
      }
// this below function checks if the caller is either the owner of the token or an approved address for that token. If neither condition is met, it reverts with a custom error. If the caller is authorized, 
// it flips the mood of the NFT by changing its associated mood in the mapping. If the current mood is SAD, it changes it to HAPPY, and vice versa.
      function flipMood(uint256 tokenId) public {
         if(getApproved(tokenId)!= msg.sender && ownerOf(tokenId)!= msg.sender){
            revert MoodNFT_CantflipMoodIfNotOwner();
            // ownerOf(tokenID)= the nft owner
            // getApproved(tokenId) = the address that is approved to manage the token
         }
            if(s_tokenIdToMood[tokenId] == Mood.SAD){
                s_tokenIdToMood[tokenId] = Mood.HAPPY;
            } else {
                s_tokenIdToMood[tokenId] = Mood.SAD;
            }
      }

       function _baseURI() internal pure override returns (string memory) {
    return "data:application/json;base64,";
}
   function tokenURI(uint256 tokenId) public view override returns(string memory){
       string memory imageURI;
       if(s_tokenIdToMood[tokenId] == Mood.SAD){
           imageURI = s_sadSvgImageUri;
       } else {
           imageURI = s_happySvgImageUri;
       }
       return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{"name":"',
                            name(),
                            '", "description":"An NFT that reflects your mood!", ',
                            '"attributes":[{"trait_type":"Mood","value":100}], ',
                            '"image":"',
                            imageURI,
                            '"}'
                        )
                    )
                )
            )
        );
   }
function getMood(uint256 tokenId) public view returns (Mood) {
    return s_tokenIdToMood[tokenId];
}

 }