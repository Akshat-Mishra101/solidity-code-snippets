pragma solidity >=0.7.0 <0.9.0;

contract cryptography
{
   //function to generate random integers within a range
   function getRandom(uint range)public view returns(uint){
       //grab information from the blockchain dynamically for randomness
       // abi.encodePacked concatenates the arguments

       //the modulus operator locks our value in a range
       return uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,msg.sender))) % range;

   }

}