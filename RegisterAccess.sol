// SPDX-License-Identifier: MIT
// Specifies the license of the contract

pragma solidity 0.8.21;
// Specifies the version of Solidity compiler this code should be compiled with

contract RegisterAccess {
    // Defines a new contract named RegisterAccess

    string[] private info; 
    // Declares a private array of strings named info

    address public owner;
    // Declares a public address variable named owner

    mapping (address => bool) public allowlist;
    // Declares a public mapping from addresses to booleans named allowlist
    
    constructor() {
        // Defines the constructor function that is called when the contract is deployed

        owner = msg.sender;
        // Sets the owner of the contract to the address that deployed the contract

        allowlist[msg.sender] = true;
        // Adds the contract deployer to the allowlist
    }
    
    event InfoChange(string oldInfo, string newinfo);
    // Declares an event that is emitted when the info is changed
    
    modifier onlyOwner {
        // Defines a modifier that restricts function access to the contract owner

        require(msg.sender == owner, "Only owner");
        // Reverts the transaction if the sender is not the owner

        _;
        // Continues execution of the function
    }
    
    modifier onlyAllowlist {
        // Defines a modifier that restricts function access to addresses on the allowlist

        require(allowlist[msg.sender] == true, "Only allowlist");
        // Reverts the transaction if the sender is not on the allowlist

        _;
        // Continues execution of the function
    }
    
    function getInfo(uint index) public view returns(string memory) {
        // Defines a public function that returns the info at a given index

        return info[index];
        // Returns the info at the given index
    }
    
    function setInfo(uint index, string memory _info) public onlyAllowlist {
        // Defines a public function that sets the info at a given index
        // This function can only be called by addresses on the allowlist

        emit InfoChange(info[index], _info);
        // Emits the InfoChange event with the old and new info

        info[index] = _info;
        // Sets the info at the given index to the new info
    }
    
    function addInfo(string memory _info) public onlyAllowlist returns(uint index) {
        // Defines a public function that adds new info to the array
        // This function can only be called by addresses on the allowlist
        // This function returns the index of the added info

        info.push(_info);
        // Adds the new info to the array

        index = info.length - 1;
        // Sets the return value to the index of the added info
    }
    
    function listInfo() public view returns(string[] memory) {
        // Defines a public function that returns all the info

        return info;
        // Returns all the info
    }
    
    function addMember(address _member) public onlyOwner {
        // Defines a public function that adds an address to the allowlist
        // This function can only be called by the owner

        allowlist[_member] = true;
        // Adds the address to the allowlist
    }
    
    function delMember(address _member) public onlyOwner {
        // Defines a public function that removes an address from the allowlist
        // This function can only be called by the owner

        allowlist[_member] = false;
        // Removes the address from the allowlist
    }
}
// End of the contract