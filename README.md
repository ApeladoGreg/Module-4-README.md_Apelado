Module 4
This program is for creating a smart contract project that implements the mint(), transfer(), redeeming tokens, checking token balance and burning tokens.

Description
Avalanche is a blockchain platform that provides decentralized apps and blockchain networks. Avalanche is designed to address the scalability issues that have conventional blockchain systems. The platform offers exceptional transaction speed and finality in milliseconds because of the consensus protocol, Avalanche. The adaptable architecture of Avalanche complements this scalability by enabling developers to design customized blockchain networks, or subnets, that satisfy particular needs and use cases.

Getting Started
Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., project.sol). Copy and paste the following code into the file:

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


To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.13" (or another compatible version), and then click on the "Compile + name of file(.sol)" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "project" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract has been deployed, you can interact with it through various functions such as mint(), transfer(), redeeming tokens, checking token balance and burning tokens.

Authors
Contributors names and contact info

Greg Florence N. Apelado

License
This project is unlicensed.
