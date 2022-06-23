// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "ShambaDONSelector.sol";


contract ShambaDataStream is ShambaDONSelector {

    AggregatorV3Interface internal dataStream;
    uint current_DON_number;

    constructor(uint DON_number, string memory data_stream) {
        current_DON_number = DON_number;
        dataStream = AggregatorV3Interface(ShambaDONSelector.fluxAggregatorAddress(DON_number, data_stream));
    }

    /**
     * Returns the latest temperature
     */
    function getLatestData() public view returns (int) {
        (
            /*uint80 roundID*/,
            int data,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = dataStream.latestRoundData();
        return data;
    }

    /**
     * Returns the number of nodes in selected DON
     */
    function numberOfNodes() public view returns (uint) {
        return ShambaDONSelector.numberOfNodes(current_DON_number);
    }

    /**
     * Returns the network of selected DON
     */
    function networkOfDON() public view returns (string memory) {
        return ShambaDONSelector.networkOfDON(current_DON_number);
    }

    function availableDataStreams() public view returns (string[] memory) {
        return ShambaDONSelector.availableDataStreamsProvidedByDON(current_DON_number);
    }

}
