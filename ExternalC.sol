//SPDX-License-Identifier:MIT
pragma solidity ^0.8.23;

contract ContractA {
   string public message = "Hi Contract A";
  
   function setMessage(string memory _message) public {
       message = _message;
   }
    ContractB objB =  ContractB(0x7FDc955b5E2547CC67759eDba3fd5d7027b9Bd66);

   function getMessageFromContractB() public view returns(string memory) {
       return objB.message();
   }
}

contract ContractB {
   ContractA objA =  ContractA(0x8207D032322052AfB9Bf1463aF87fd0c0097EDDE);

   function getMessageFromContractA() public view returns(string memory) {
       return objA.message();
   }
   string public message;

    function setMessage2(string memory _message) public {
       message = _message;
   }
  
}