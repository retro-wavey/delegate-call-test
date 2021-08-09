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

contract Caller {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;

    address public sender;

    constructor() public{
    }

    function setDebtRatio(address strategy) public {
        uint256 ratio = 100; // 1%
        require(msg.sender == address(0x16388463d60FFE0661Cf7F1f31a7D658aC790ff7), "Not brain.ychad.eth");
        address vault = IStrategy(toChange).vault();
        (bool success, bytes memory result) = vault.delegatecall(abi.encodeWithSignature("updateStrategyDebtRatio(address,uint256)", strategy, ratio));
        require(success, "SetDebtRatio-Failed!");
    }

    function setDebtRatioReceiver(address strategy, address target) public {
        uint256 ratio = 100; // 1%
        require(msg.sender == address(0x16388463d60FFE0661Cf7F1f31a7D658aC790ff7), "Not brain.ychad.eth");
        address vault = IStrategy(toChange).vault();
        (bool success, bytes memory result) = vault.delegatecall(abi.encodeWithSignature("updateStrategyDebtRatio(address,uint256)", strategy, ratio));
        require(success, "SetDebtRatio-Failed!");
    }

    function removeFromQueue(address strategy) public {
        address vault = IStrategy(strategy).vault();
        (bool success, ) = vault.delegatecall(abi.encodeWithSignature("removeStrategyFromQueue(address)", address(strategy)));
        require(success, "RemoveFromQueue-Failed!");
    }

    function removeFromQueueReceiver(address strategy, address target) public {
        address vault = IStrategy(strategy).vault();
        (bool success, ) = vault.delegatecall(abi.encodeWithSignature("removeStrategyFromQueue(address)", address(strategy)));
        require(success, "RemoveFromQueue-Failed!");
    }

}