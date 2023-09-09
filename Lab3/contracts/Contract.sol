// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "./Library.sol";
import "./Interface.sol";

contract RegistryContract {
    using RegistryLib for *;

    mapping(address => RegistryLib.Person) private persons;
    mapping(address => RegistryLib.Company) private companies;

    event PersonCreated(address indexed personAddress, string name, string surname);
    event CompanyCreated(address indexed companyAddress, string name);

    function addPerson(address _address, string memory _name, string memory _surname) public {
        persons[_address] = RegistryLib.Person(_name, _surname);
        emit PersonCreated(_address, _name, _surname);
    }

    function addCompany(address _address, string memory _name) public {
        companies[_address] = RegistryLib.Company(_name);
        emit CompanyCreated(_address, _name);
    }

    function getPerson(address _address) public view returns (string memory, string memory) {
        return (persons[_address].name, persons[_address].surname);
    }

    function getCompany(address _address) public view returns (string memory) {
        return companies[_address].name;
    }
}