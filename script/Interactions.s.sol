// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";   
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {DeployBasicNft} from "./DeployBasicNft.s.sol";


contract MintBasicNft is Script{
    string public constant TOKEN_URI = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNft",block.chainid);
        mintNftOnContract(mostRecentlyDeployed); // Call the mintNftOnContract function with the address of the most recently deployed BasicNft contract to mint a new NFT.
    }

    function mintNftOnContract(address nftContract) internal {
        vm.startBroadcast();

        BasicNft basicNft = BasicNft(nftContract);
        basicNft.mintNft(TOKEN_URI);

        vm.stopBroadcast();
    }

}