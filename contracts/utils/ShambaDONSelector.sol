//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ShambaDONSelector {
    function fluxAggregatorAddress(uint DON_number) internal pure returns (address) {
        if (DON_number == 1) {
            return 0xa327d8f630E48C0522F44011F073D3804883A6E5;
        }
        else if (DON_number == 2) {
            return 0x0aCC582367Da6453ef609e490F219171ee1a0e41;
        }
        else {
            return 0x0000000000000000000000000000000000000000;
        }

    }
    
    function numberOfNodes(uint DON_number) internal pure returns (uint) {
        if (DON_number == 1) {
            return 3;
        }
        else if (DON_number == 2) {
            return 4;
        }
        else {
            return 0;
        }
    }

    function networkOfDON(uint DON_number) internal pure returns (string memory) {
        if (DON_number == 1) {
            return "Ethereum Kovan";
        }
        else if (DON_number == 2) {
            return "Ethereum Kovan";
        }
        else {
            return "";
        }
    }
}