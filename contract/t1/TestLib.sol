
contract TestLib{
    using Math for uint;

    function callMax(uint x, uint y) public pure returns (uint){
        return x.max(y);
    }
}