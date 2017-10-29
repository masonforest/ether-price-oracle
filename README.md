Ether Price Oracle
==================

The Ether Price Oracle is a basic implementation of Ether to USD price
[Oracle](https://www.ethnews.com/what-is-an-oracle) on the Ethereum Blockchain.

It utilizes [Oracleize](http://www.oraclize.it/) and the
[Poloniex Digital Asset Exchange API](view-source:https://poloniex.com/support/api/).


Usage
=====


    pragma solidity ^0.4.0;

    interface EtherPriceOracle {
      function price() public constant returns (uint);
    }

    contract EtherToUSDConverter {
      EtherPriceOracle priceOracle;

      function EtherToUSDConverter(address priceOracleAddress) {
          priceOracle = EtherPriceOracle(priceOracleAddress);
      }

      function convert(uint amountInEther) public view returns (uint) {
        return amountInEther * priceOracle.price();
      }
    }

EtherPriceOracle is deployed at the following addresses:

|  Network  |   Address    |
------------|---------------
|Main Network | [0xf5c600cda3b7289b2863872b23084527fb4c6107](https://etherscan.io/address/0xf5c600cda3b7289b2863872b23084527fb4c6107) |
Ropsten  | [0x9f7f9f38825012623cae7982ead15cc0571adcde](https://ropsten.etherscan.io/address/0x9f7f9f38825012623cae7982ead15cc0571adcde) |
Rinkeby  | [0xdcd37d397ab4eeb86ab8aed69fdc551f7c0bc77b](https://rinkeby.etherscan.io/address/0xdcd37d397ab4eeb86ab8aed69fdc551f7c0bc77b) |
Kovan    | [0x9e803018893dc7ec24c19c8779a4444ba49c44e4](https://kovan.etherscan.io/address/0x9e803018893dc7ec24c19c8779a4444ba49c44e4) |


Long Term Goals
===

Ideally the Ether Price Oracle would be [decentralized autonomous
organization](https://en.wikipedia.org/wiki/Decentralized_autonomous_organization)
(a DAO) whose goal it would be to provide the most accurate Ether price
possible. You could potentially have multiple mechanisms which determine the
price and construct a set of checks and balances between sources which ensure
correctness and accuracy. Possible sources include:

   * A
     [ShellingCoin](https://blog.ethereum.org/2014/03/28/schellingcoin-a-minimal-trust-universal-data-feed/) implmentation.
  * A trusted feed (possibly provided by the Ethereum Foundation or another
    reputable source)
  * The existing oraclize solution


FAQ
===

__Why don't you use the Coinbase/GDX API?__

The Coinbase API requires an API key HTTP request headers to query the API.
Oracalize [doesn't currently support](https://ethereum.stackexchange.com/a/12317) request headers in API calls.
