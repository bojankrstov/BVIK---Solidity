// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract PersonPackage {
    struct Person {
        string firstName;
        string lastName;
    }

    mapping(address => Person) public people;

    event PersonAdded(address indexed personAddress, string firstName, string lastName);

    function addPerson(string memory firstName, string memory lastName) public {
        Person storage newPerson = people[msg.sender];
        newPerson.firstName = firstName;
        newPerson.lastName = lastName;

        emit PersonAdded(msg.sender, firstName, lastName);
    }

    function getPerson(address personAddress) public view returns (string memory, string memory) {
        return (people[personAddress].firstName, people[personAddress].lastName);
    }
}