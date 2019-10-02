pragma solidity ^0.5.0;

// Change name to Stateless
contract Adoption {

    address[16] public adopters;

// Change function name adopt ----> affirm and perameter petId ---> weightId
function adopt(uint petId) public returns (uint) {
  require(petId >= 0 && petId <= 15);

  adopters[petId] = msg.sender;

  return petId;
}

// Retrieving the adopters
function getAdopters() public view returns (address[16] memory) {
  return adopters;
}

}

//CHANGE TEST FILES AND ALL COMMENTS
