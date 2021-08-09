// SPDX-License-Identifier: AGPL-3.0
// Feel free to change the license, but this is what we use

// Feel free to change this version of Solidity. We support >=0.6.0 <0.7.0;
pragma solidity 0.6.12;
pragma experimental ABIEncoderV2;

import {
    SafeERC20,
    SafeMath,
    IERC20,
    Address
} from "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";
import "@openzeppelin/contracts/math/Math.sol";

interface IVault {
    function claimReward(address) external;
    function updateStrategyDebtRatio(address,uint256) external;
}

interface IStrategy {
    function vault() external view returns (address);
}

contract Callee {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;

    event Called(address indexed caller, address strategy, address vault, uint256 ratio);

    constructor() public{
    }

    function updateStrategyDebtRatio(address strategy, uint256 ratio) public returns (address){
        require(msg.sender == address(0x16388463d60FFE0661Cf7F1f31a7D658aC790ff7), "Not brain.ychad.eth");
        address vault = IStrategy(strategy).vault();
        emit Called(msg.sender, strategy, vault, ratio);
        return msg.sender;
    }

    function removeFromQueueReceiver(address strategy) public returns (address){
        require(msg.sender == address(0x16388463d60FFE0661Cf7F1f31a7D658aC790ff7), "Not brain.ychad.eth");
        address vault = IStrategy(strategy).vault();
        return msg.sender;
    }

}