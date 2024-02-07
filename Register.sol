// SPDX-License-Identifier: MIT
// Specifies the license of the contract

pragma solidity 0.8.21;
// Specifies the version of Solidity compiler this code should be compiled with

contract Register {
    // Defines a new contract named Register

    string private info;
    // Declares a private string variable named info

    function getInfo() public view returns (string memory) {
        // Defines a public function that returns the info

        return info; 
        // Returns the info
    }

    function setInfo(string memory _info) public {
        // Defines a public function that sets the info

        info = _info;
        // Sets the info to the new value
    }
}
// End of the contract