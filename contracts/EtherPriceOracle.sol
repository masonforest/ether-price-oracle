pragma solidity ^0.4.0;

import "./usingOraclize.sol";

contract EtherPriceOracle is usingOraclize {
    uint public price_;
    uint public updateFrequency;

    function EtherPriceOracle(uint updateFrequency_) payable {
      updateFrequency = updateFrequency_;
      update();
    }

    function __callback(bytes32 myid, string result) {
      if (msg.sender != oraclize_cbAddress()) throw;
      price_ = parseInt(result, 2);
      update();
    }

    function price() public constant returns (uint){
      return price_;
    }

    function update() payable {
      oraclize_query(updateFrequency, "URL", "json(https://poloniex.com/public?command=returnTicker).USDT_ETH.last");
    }
}
