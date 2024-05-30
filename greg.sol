// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.0.2/access/Ownable.sol";

contract Degen is ERC20, Ownable {
    uint256[] internal itemIds;
    mapping(uint256 => Value) public items;

    struct Value {
        string name;
        uint256 cost;
    }

    constructor(address owner) ERC20("Degen", "DGN") Ownable(owner) {
        _mint(owner, 777);
    }

    function createItem(string memory _name, uint256 _cost) external onlyOwner {
        Value memory newItem = Value({name: _name, cost: _cost});
        items[itemIds.length] = newItem;
        itemIds.push(itemIds.length);
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    function burnFrom(address from, uint256 amount) external onlyOwner {
        _burn(from, amount);
    }

    function transferTokens(address to, uint256 amount) external {
        _transfer(msg.sender, to, amount);
    }

    function checkTokenBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }

    function redeemItem(uint256 id) external {
        require(items[id].cost > 0, "Item does not exist!");
        require(balanceOf(msg.sender) >= items[id].cost, "Insufficient Balance");

        _transfer(msg.sender, address(this), items[id].cost);

        delete items[id];
    }
}
