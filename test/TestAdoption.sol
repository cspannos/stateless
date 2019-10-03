pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
 // The address of the adoption contract to be tested
 Adoption adoption = Adoption(DeployedAddresses.Adoption());

 // The id of the pet that will be used for testing
 uint expectedhumanId = 8;

 //The expected owner of adopted pet is this contract
 address expectedAdopter = address(this);

 // Testing the adopt() function
 function testUserCanAdoptPet() public {
   uint returnedId = adoption.adopt(expectedhumanId);

   Assert.equal(returnedId, expectedhumanId, "Adoption of the expected pet should match what is returned.");
 }

// Testing retrieval of a single pet's owner
function testGetAdopterAddressByhumanId() public {
  address adopter = adoption.adopters(expectedhumanId);

  Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
}

// Testing retrieval of all pet owners
function testGetAdopterAddressByhumanIdInArray() public {
  // Store adopters in memory rather than contract's storage
  address[16] memory adopters = adoption.getVerifiers();

  Assert.equal(adopters[expectedhumanId], expectedAdopter, "Owner of the expected pet should be this contract");
}

}
