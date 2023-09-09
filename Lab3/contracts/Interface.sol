// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

interface RegistryInterface {

    function addPerson(address _address, string memory _name, string memory _surname) external;

    function addCompany(address _address, string memory _name) external;

    function getPerson(address _address) external view returns (string memory, string memory);

    function getCompany(address _address) external view returns (string memory);

    event PersonCreated(address indexed personAddress, string name, string surname);
    event CompanyCreated(address indexed companyAddress, string name);
}