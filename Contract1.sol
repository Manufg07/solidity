// SPDX-License-Identifier: MIT
pragma solidity  0.8.20;

contract Name {
    string name = 'manu';

    function get() public view returns (string memory) {
        return (name);
    }

    function set(string memory _name) public {
        name = _name;
    }
}

