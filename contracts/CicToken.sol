pragma solidity 0.6.2;

import "./ERC20.sol";
import "./Proxiable.sol";
import "./Ownable.sol";

contract CicToken is ERC20, Proxiable, Ownable { 

  constructor() public {      
  }

  bool initialized = false;

  function initialize(string memory name, string memory symbol, uint256 supply) public {
    require(!initialized, "Initialize can only be called once");

    initialized=true;

    _initERC20(name, symbol);
    _mint(msg.sender, supply);
    _setOwner(msg.sender);
    emit OwnershipTransferred(address(0), msg.sender);
  }

  function upgradeImplementation(address newImplementation) public onlyOwner {
      _updateCodeAddress(newImplementation);
  }
}