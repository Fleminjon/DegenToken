// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ExMachinaToken is ERC20, Ownable {
    constructor(uint256 initialSupply, uint8 decimals) ERC20("Degen", "DGN") Ownable(msg.sender) {
        _mint(msg.sender, initialSupply * (10 ** uint256(decimals)));
    }
    
    // Only the contract owner can mint new tokens
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    
    // Users can burn their tokens
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        return super.transfer(recipient, amount);
    }

    function BalanceChecking() public view returns (uint256) {
        return balanceOf(msg.sender);

    }

    function redeems (uint ChosenRedeem) public returns (string memory Message){
        if (ChosenRedeem == 1) {
            require (balanceOf(msg.sender) >= 1, "wrong amount");
            burn(1);
            Message = "You have purchased the Shampoo";

        }

        else if (ChosenRedeem == 2) {
            require (balanceOf(msg.sender) >= 5, "wrong amount");
            burn(5);
            Message = "You have purchased the Conditioner";
        }

        else if (ChosenRedeem == 3) {
            require (balanceOf(msg.sender) >= 7, "wrong amount");
            burn(7);
            Message = "You have purchased the Soap";
        }

        return Message;
    }


}
