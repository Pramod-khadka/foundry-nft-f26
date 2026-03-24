// SPDX-License-Identiifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BasicNft} from "../../src/BasicNft.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";


contract BasicNftTest is Test {
    DeployBasicNft public deployer; // Declare a variable of type DeployBasicNft to hold the instance of the deployment script.
    BasicNft public basicNft; // Declare a variable of type BasicNft to hold the instance of the deployed BasicNft contract.
 address public USER = makeAddr("USER"); // Create a new address using the makeAddr function from the Test contract and assign it to the user variable.
 // This address will be used to simulate a user interacting with the BasicNft contract.
  string public constant TOKEN_URI = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json"; // Define a constant string variable to hold the token URI that will be used for minting NFTs.
     function setUp() public {
        deployer = new DeployBasicNft(); // Create a new instance of the DeployBasicNft contract.
        basicNft = deployer.run(); // Call the run function of the deployer to deploy the BasicNft contract and assign it to the basicNft variable.
}

function testNameIsCorect() public view {
    string memory expectedName = "puntu";
    string memory actualName = basicNft.name();

    assert (keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
}

 function testCanMintAndHaveTokenURI() public {
    vm.prank(USER);
    basicNft.mintNft(TOKEN_URI);

    assert(basicNft.balanceOf(USER) == 1);
    assert(keccak256(abi.encodePacked(TOKEN_URI)) == keccak256(abi.encodePacked(basicNft.tokenURI(0))));
 }
}