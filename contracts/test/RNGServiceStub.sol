// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.17;

import "../RNGInterface.sol";

contract RNGServiceStub is RNGInterface {
  uint256 internal random;
  uint64  internal completedAtTimestamp;
  address internal feeToken;
  uint256 internal requestFee;

  function getLastRequestId() external pure override returns (uint32 requestId) {
    return 1;
  }

  function setRequestFee(address _feeToken, uint256 _requestFee) external {
    feeToken = _feeToken;
    requestFee = _requestFee;
  }

  /// @return _feeToken
  /// @return _requestFee
  function getRequestFee() external view override returns (address _feeToken, uint256 _requestFee) {
    return (feeToken, requestFee);
  }

  function setRandomNumber(uint256 _random) external {
    random = _random;
    completedAtTimestamp = uint64(block.timestamp);
  }

  function requestRandomNumber() external pure override returns (uint32, uint32) {
    return (1, 1);
  }

  function isRequestComplete(uint32) external pure override returns (bool) {
    return true;
  }

  function randomNumber(uint32) external view override returns (uint256) {
    return random;
  }

  function completedAt(uint32 requestId) external view override returns (uint64) {
    if(requestId != 1) return 0;
    return completedAtTimestamp;
  }
}
