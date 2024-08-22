// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

contract Bank{
    //mapping(type of key => type of value mappingName
    uint public count;
    mapping(uint=>address) public  addressCount;
    mapping (address=>uint) public balanceLedger;
    address public admin;

    constructor(){
        admin = msg.sender;
    }
    
    modifier onlyAdmin (){
        require(msg.sender == admin,"Unautherized access");
        _;
    }

    modifier balanceCheck(uint amnt){
        require(balanceLedger[msg.sender]>=amnt,"Insufficient Balance");
        _;
    }

    function deposite() public payable {
        if(balanceLedger[msg.sender]==0){
            addressCount[++count]=msg.sender;
        }
        balanceLedger[msg.sender]+=msg.value;
    }

    function withdraw(uint amnt) public balanceCheck(amnt) {
        // require(balanceLedger[msg.sender]>=amnt,"Insufficient Balance");
        balanceLedger[msg.sender]-=amnt;
        payable (msg.sender).transfer(amnt);
    }

    function transfer (uint amnt, address ad) public balanceCheck(amnt) {
        // require(balanceLedger[msg.sender]>=amnt,"insufficient balance");
        balanceLedger[msg.sender]-=amnt;
        payable (ad).transfer(amnt);
    }

    function monitorBalance() public view onlyAdmin returns (address,uint){
        uint maxBalance;
        address maxAddress;
        for(uint i=1; i<=count; i++){
            if(maxBalance<balanceLedger[addressCount[i]]){
                maxAddress=addressCount[i];
                maxBalance = balanceLedger[maxAddress];
            }
        }
        return (maxAddress,maxBalance);
    }
    
}