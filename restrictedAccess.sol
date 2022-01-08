pragma solidity >=0.7.0 <0.9.0;
contract RestrictedAccess{
    address public owner=msg.sender;
    uint public creation_time=block.timestamp;
    
    modifier onlyOwner(address _owner){
       require(_owner == msg.sender);
       _;
    }
    modifier costs(uint _amount) {
        require(msg.value >= _amount,
        'Not enough Ether provided');
        _;
    }
    
    function forceOwnerChange(address _newOwner) payable public costs(200 ether) {
        owner = _newOwner;
    }
    modifier onlyAfter(uint time)
    {
        require(block.timestamp >= time);
        _;
    }
    function change_address(address _owner)public onlyOwner(owner){
        owner = _owner;
    }
    function disown() onlyOwner(owner) onlyAfter(creation_time + 5 weeks) public {
        delete owner;
    } 
}