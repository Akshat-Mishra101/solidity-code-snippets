pragma solidity >=0.7.0 <0.9.0;

contract nestedMapping{
   uint num= -1;
   struct Movie{
      string title;
      string director;

   }
   
   mapping(address => mapping(uint  => Movie)) public nestedMap;


   function addMovie(uint id, string memory title, string memory director) public {
       nestedMap[msg.sender][id] = Movie(title, director);


       //msg.sender is a global variable in solidity that captures the address of the original sender
   }
}