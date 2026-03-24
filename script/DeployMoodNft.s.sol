// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {MoodNft} from "../src/MoodNft.sol";
import {Script, console} from "forge-std/script.sol";    
 import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";


contract DeployMoodNft  is Script{
     function run() external returns(MoodNft){
        string memory sadSvg = vm.readFile("./img/sad.svg");// this reads the svg file and returns it as a string, we need to convert this string into a format that browsers understand, we will do that in the next step.
        string memory happySvg = vm.readFile("./img/happy.svg");
       vm.startBroadcast();
        MoodNft moodNft = new MoodNft(svgToImageURI(sadSvg), svgToImageURI(happySvg));
        vm.stopBroadcast();
        return moodNft;
     }


// below function  converts svg into a format browsers understand,
 // the below function is taking the svg string parameter, encoding it with the OpenZeppelin
 //Base64.encode function and then prepends the encoded value with our baseUrl.
     function svgToImageURI(string memory svg) public pure returns(string memory){
        string memory baseURL= "data:image/svg+xml;base64,";// this is the format that browsers understand when we want to display svg as an image, we need to convert svg into base64 and then add this prefix to it.
        string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))));// this converts svg into base64 format, we need to convert it into bytes first because the Base64 library works with bytes, then we encode it and get the base64 string.
         return string(abi.encodePacked(baseURL, svgBase64Encoded));
     }
}