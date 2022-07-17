// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./ShambaDONSelector.sol";

library ShambaDataStream {
    AggregatorV3Interface internal dataStream;
    ShambaDONSelector internal shambaDONSelector;
    uint256 current_DON_number;
    string[] public dataStreams;

    constructor(uint256 DON_number, string memory data_stream) {
        current_DON_number = DON_number;
        shambaDONSelector = ShambaDONSelector(
            0x9e4630679d1e8f31734a983Ce1d96317841E8831
        );
        dataStream = AggregatorV3Interface(
            shambaDONSelector.fluxAggregatorAddress(DON_number, data_stream)
        );
    }

    /**
     * Returns the latest data
     */
    function getLatestData() public view returns (int256) {
        (
            ,
            /*uint80 roundID*/
            int256 data,
            ,
            ,

        ) = /*uint startedAt*/
            /*uint timeStamp*/
            /*uint80 answeredInRound*/
            dataStream.latestRoundData();
        return data;
    }

    /**
     * Returns the number of nodes in selected DON
     */
    function numberOfNodes() public view returns (uint256) {
        return shambaDONSelector.numberOfNodes(current_DON_number);
    }

    /**
     * Returns the network of selected DON
     */
    function networkOfDON() public view returns (string memory) {
        return shambaDONSelector.networkOfDON(current_DON_number);
    }

    /**
     * Returns the list of data streams provided by selected DON
     */

    function availableDataStreams() public returns (string[] memory) {
        dataStreams = shambaDONSelector.availableDataStreamsProvidedByDON(
            current_DON_number
        );
        return dataStreams;
    }
}
