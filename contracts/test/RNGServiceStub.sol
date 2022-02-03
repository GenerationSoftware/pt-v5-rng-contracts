// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.6;

import "../interfaces/RNGInterface.sol";

contract RNGServiceStub is RNGInterface {
  uint256 internal random;
  address internal feeToken;
  uint256 internal requestFee;

  function getLastRequestId() external pure override returns (uint256 requestId) {
    return 1;
  }

  function setRequestFee(address _feeToken, uint256 _requestFee) external {
    feeToken = _feeToken;
    requestFee = _requestFee;
  }

  /// @return _feeToken
  /// @return _requestFee
  function getRequestFee() external view returns (address _feeToken, uint256 _requestFee) {
    return (feeToken, requestFee);
  }

  function setRandomNumber(uint256 _random) external {
    random = _random;
  }

  function requestRandomNumber() external pure override returns (uint256, uint256) {
    return (1, 1);
  }

  function isRequestComplete(uint256) external pure override returns (bool) {
    return true;
  }

  function randomNumber(uint256) external view override returns (uint256) {
    return random;
  }
}
