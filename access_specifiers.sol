pragma solidity >=0.7.0 <0.9.0;
contract mycon{
    uint value;
    function changeval(uint _value) 
    public {
        value = _value;

    }

    //view restricts this function to having read only access, the view function cannot modify the state 
    function getVal() public view returns(uint){
        return value;
    }

    //the pure keyword restricts even the reading of the contract data, a pure function can neither read, nor modify contract data
    function getNewVal() public pure returns(string memory){
       return "hello world";
    }
}