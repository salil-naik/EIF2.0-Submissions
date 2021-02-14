// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

// dead man's switch contract
contract DMS {
    address payable owner;
    uint lastAliveBlock = 0; 
    address payable sendAddress;
    
    constructor(address payable _sendAddress) {
        owner = msg.sender;
        sendAddress = _sendAddress;
    }
    
    modifier onlyOwner {
        require (msg.sender == owner);
        _;
    }
    
    function destroyContract() internal {
        selfdestruct(sendAddress);
    }
    
    // to indicate that contract owner is alive. 
    function stillAlive() external onlyOwner {
        lastAliveBlock = block.number;
    }
    
    /*
        To check whether the owner is still alive.
        If the owner of that contract has not called a still_alive function on the contract in the last 10 blocks, send all of its balance to a pre-set address.
    */
    function checkIfAlive() public returns (bool) {
        // return lastAliveBlock;
        
        if(lastAliveBlock < block.number -10){
            destroyContract();
            return false;
        }
        return true;
    }
}