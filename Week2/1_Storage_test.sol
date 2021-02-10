// SPDX-License-Identifier: GPL-3.0
    
pragma solidity >=0.4.22 <0.8.0;
import "remix_tests.sol";
import "remix_accounts.sol";
import "../contracts/1_Storage.sol";

contract testSuite {
    
    Storage foo;

    function beforeAll() public {
        // Here should instantiate tested contract
        foo = new Storage();
    }

    // testing if value is set as expected
    function checkValue() public returns (bool) {
        foo.store(1947);
        return Assert.equal(foo.retrieve(), 1947, 'value is not 1947');
    }
}