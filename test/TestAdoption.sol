pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption{
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    function testUserCanAdoptPet() public{
        uint returnedId = adoption.adopt(8);
        uint expected = 9;
        Assert.equal(returnedId,expected,"Adoption of pet Id 8 should be recorded");
    }

    function testGetAdopterAddressByPetid() public {
        address expected = this;
        address adopter = adoption.adopters(8);
        Assert.equal(adopter,expected,"Owner of pet ID 8 should be record");
    }

    function testGetAdopterAddressByPetIdInArray() public {
        address expected = this;
        address[16] memory adopters = adoption.getAdopters();
        Assert.equal(adopters[8],expected,"Owner of Pet Id 8 should be recorded");
    }

}