pragma solidity>=0.7.0 <0.9.0;
//The Contract allows only the creator to create/mint new tokens
//anyone can send or receive this coin without the need of a username or password
//it only requires an ethereum keypair
contract coin{
     
     address public minter;
     mapping(address => uint) public balances;
     event Sent(address from, address to,uint amount);
     constructor(){
         minter = msg.sender;
     }
    
    function mint(address receiver, uint amount) public
    {
        require(minter == msg.sender);
        balances[receiver] += amount;
    }

    error insufficientBalance(uint amount_requested,uint amount_available);
    function Send(address receiver, uint amount) public
    {
      if(amount > balances[msg.sender]){
      revert insufficientBalance({
          amount_requested:amount,
          amount_available:balances[msg.sender]
      });
      
      }

      balances[msg.sender] -= amount;
      balances[receiver] += amount;
      emit Sent(msg.sender,receiver,amount);
    }
}