// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.5.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "../../FeeHelper.sol";

contract TokenManagementContract is FeeHelper {

    event ResponseCode(int responseCode);
    event PausedToken(bool paused);

    function deleteTokenPublic(address token) public returns (int responseCode) {
        responseCode = HederaTokenService.deleteToken(token);
        emit ResponseCode(responseCode);

        if (responseCode != HederaResponseCodes.SUCCESS) {
            revert();
        }
    }

    function freezeTokenPublic(address token, address account) public returns (int responseCode) {
        responseCode = HederaTokenService.freezeToken(token, account);
        emit ResponseCode(responseCode);

        if (responseCode != HederaResponseCodes.SUCCESS) {
            revert();
        }
    }

    function revokeTokenKycPublic(address token, address account) external returns (int64 responseCode) {
        (responseCode) = this.revokeTokenKyc(token, account);
        emit ResponseCode(responseCode);

        if (responseCode != HederaResponseCodes.SUCCESS) {
            revert();
        }
    }

    function pauseTokenPublic(address token) public returns (int responseCode) {
        responseCode = this.pauseToken(token);
        emit ResponseCode(responseCode);

        if (responseCode != HederaResponseCodes.SUCCESS) {
            revert();
        }

        emit PausedToken(true);
    }

    function wipeTokenAccountPublic(address token, address account, uint32 amount) public returns (int responseCode) {
        responseCode = HederaTokenService.wipeTokenAccount(token, account, amount);
        emit ResponseCode(responseCode);

        if (responseCode != HederaResponseCodes.SUCCESS) {
            revert ();
        }
    }

    function wipeTokenAccountNFTPublic(address token, address account, int64[] memory serialNumbers) public returns (int responseCode) {
        responseCode = HederaTokenService.wipeTokenAccountNFT(token, account, serialNumbers);
        emit ResponseCode(responseCode);

        if (responseCode != HederaResponseCodes.SUCCESS) {
            revert ();
        }
    }

    function updateTokenInfoPublic(address token, IHederaTokenService.HederaToken memory tokenInfo)external returns (int responseCode) {
        (responseCode) = this.updateTokenInfo(token, tokenInfo);
        emit ResponseCode(responseCode);

        if(responseCode != HederaResponseCodes.SUCCESS) {
            revert();
        }
    }

    function updateTokenExpiryInfoPublic(address token, IHederaTokenService.Expiry memory expiryInfo)external returns (int responseCode) {
        (responseCode) = this.updateTokenExpiryInfo(token, expiryInfo);
        emit ResponseCode(responseCode);

        if(responseCode != HederaResponseCodes.SUCCESS) {
            revert();
        }
    }

    function updateTokenKeysPublic(address token, IHederaTokenService.TokenKey[] memory keys) public returns (int64 responseCode) {
        (responseCode) = HederaTokenService.updateTokenKeys(token, keys);
        emit ResponseCode(responseCode);

        if(responseCode != HederaResponseCodes.SUCCESS) {
            revert();
        }
    }

    function burnTokenPublic(address token, uint64 amount, int64[] memory serialNumbers) external returns (int256 responseCode, uint64 newTotalSupply) {
        (responseCode, newTotalSupply) = HederaTokenService.burnToken(token, amount, serialNumbers);
        emit ResponseCode(responseCode);

        if (responseCode != HederaResponseCodes.SUCCESS) {
            revert ();
        }
    }

    function dissociateTokensPublic(address account, address[] memory tokens) external returns (int256 responseCode) {
        (responseCode) = HederaTokenService.dissociateTokens(account, tokens);
        emit ResponseCode(responseCode);

        if (responseCode != HederaResponseCodes.SUCCESS) {
            revert ();
        }
    }

    function dissociateTokenPublic(address account, address token) public returns (int responseCode) {
        responseCode = HederaTokenService.dissociateToken(account, token);
        emit ResponseCode(responseCode);

        if (responseCode != HederaResponseCodes.SUCCESS) {
            revert ();
        }
    }

    function approvePublic(address token, address spender, uint256 amount) public returns (int responseCode) {
        responseCode = HederaTokenService.approve(token, spender, amount);
        emit ResponseCode(responseCode);

        if (responseCode != HederaResponseCodes.SUCCESS) {
            revert ();
        }
    }

    function approveNFTPublic(address token, address approved, uint256 serialNumber) public returns (int responseCode) {
        responseCode = HederaTokenService.approveNFT(token, approved, serialNumber);
        emit ResponseCode(responseCode);

        if (responseCode != HederaResponseCodes.SUCCESS) {
            revert ();
        }
    }

    function setApprovalForAllPublic(address token, address operator, bool approved) public returns (int responseCode) {
        responseCode = HederaTokenService.setApprovalForAll(token, operator, approved);
        emit ResponseCode(responseCode);

        if (responseCode != HederaResponseCodes.SUCCESS) {
            revert();
        }
    }
}
