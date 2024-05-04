// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RewardPointsCalculator {
    struct Trip {
        address driverID;
        uint256 distance;
        uint256 startLocation; // GPS coordinates: latitude and longitude
        uint256 endLocation; // GPS coordinates: latitude and longitude
        uint256 rewardMultiplier; // Electric Vehicle: 3, Hybrid Vehicle: 2, Normal Vehicle: 1
    }

    mapping(address => uint256) public driverPoints;

    function calculateRewardPoints(
        address _driverID,
        uint256 _distance,
        uint256 _startLocation,
        uint256 _endLocation,
        uint256 _rewardMultiplier
    ) external {
        require(_rewardMultiplier >= 1 && _rewardMultiplier <= 3, "Invalid reward multiplier");

        uint256 points = _distance * _rewardMultiplier;
        driverPoints[_driverID] += points;
    }

    function getDriverPoints(address _driverID) external view returns (uint256) {
        return driverPoints[_driverID];
    }
}