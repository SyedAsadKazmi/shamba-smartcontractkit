//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ShambaDONSelector {

    string[] dataStreamsList;
    
    function fluxAggregatorAddress(uint DON_number, string memory data_stream) internal pure returns (address) {
        if (DON_number == 1) {

            if (compareStringsbyBytes(data_stream, "temperature_new-delhi")) {
                return 0xa327d8f630E48C0522F44011F073D3804883A6E5;
            }
            else if (compareStringsbyBytes(data_stream, "fire_riverside")) {
                return 0xfebb68b8d8cdf8cd5B932CF80aDFf8ed7e76a9d1;
            }
            else {
                return 0x0000000000000000000000000000000000000000;
            }
            
        }

        else if (DON_number == 2) {
            if (compareStringsbyBytes(data_stream, "temperature_nairobi")) {
                return 0x0aCC582367Da6453ef609e490F219171ee1a0e41;
            }
            else {
                return 0x0000000000000000000000000000000000000000;
            }   
        }

        else if (DON_number == 3) {

            if (compareStringsbyBytes(data_stream, "air-quality_new-delhi")) {
                return 0x4b7c440b5e980Ae67bA801979cAbDb155976e6c1;
            }
            else {
                return 0x0000000000000000000000000000000000000000;
            }

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
            return 5;
        }
        else if (DON_number == 3) {
            return 3;
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
        else if (DON_number == 3) {
            return "Polygon Mumbai";
        }
        else {
            return "";
        }
    }

    function availableDataStreamsProvidedByDON(uint DON_number) internal returns (string[] memory) {
        
        if (DON_number == 1) {
            dataStreamsList.push("temperature_new-delhi");
            dataStreamsList.push("fire_riverside");
            return dataStreamsList;
        }
        else if (DON_number == 2) {
            dataStreamsList.push("temperature_nairobi");
            return dataStreamsList;
        }
        else if (DON_number == 3) {
            dataStreamsList.push("air-quality_new-delhi");
            return dataStreamsList;
        }
        else {
            return dataStreamsList;
        }
    }

    function compareStringsbyBytes(string memory s1, string memory s2) private pure returns(bool){
        return keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(s2));
    }
}