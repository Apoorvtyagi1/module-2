// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract AryaContract {
    string public OwnerName;
    address payable private constant spendAddress =
        payable(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);

    event TokensTransferred(string);
    event TokensWithdrawn(string);

    function tokentransfer() external payable {
        require(msg.value > 0 ether, "Amount should be more than 0");
        emit TokensTransferred("Tokens transferred successfully!");
    }

    function Tokenswithdraw() external {
        require(address(this).balance > 0, "No tokens available to withdraw");
        uint256 amount = address(this).balance;
        spendAddress.transfer(amount);
        emit TokensWithdrawn("Tokens burned successfully!");
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function getOwnerName() external view returns (string memory) {
        return OwnerName;
    }
}
