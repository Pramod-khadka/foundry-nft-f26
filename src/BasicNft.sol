// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import  {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
uint256 private s_tokenCounter; // state variable to keep track of token IDs
mapping(uint256 => string) private s_tokenIDToUri;
//s_tokenIdUri :  maps a token id to its metadata URI. this is how the nft knows where to find its metadata, which typically includes information about the NFT such as its name,
// description, and image. By using a mapping, we can easily associate each token ID with its corresponding metadata URI, allowing us to retrieve the metadata when needed.

    constructor()ERC721("puntu","tnt"){
         s_tokenCounter=0; // initialize the token counter to 0 when the contract is deployed(first nft token id will be 0.)
    }

    function mintNft(string memory tokenIDUri)public {
        s_tokenIDToUri[s_tokenCounter] = tokenIDUri;// stored the metadata URI for the new token Id.
        _safeMint(msg.sender, s_tokenCounter); // mint the new token to the caller of the function, using the current value of s_tokenCounter as the token ID.
        s_tokenCounter++; // increment the token counter for the next minting.
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return s_tokenIDToUri[tokenId];
    }
//ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json

}
