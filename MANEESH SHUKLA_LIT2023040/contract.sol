// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FlexiLoans {
    struct Loan {
        address borrower;
        uint256 amount;
        uint256 interestRate;
        uint256 duration;
        uint256 collateralValue;
        uint256 createdAt;
        uint256 repaidAt;
        bool active;
    }

    mapping(uint256 => Loan) public loans;

    event LoanCreated(uint256 loanId, address indexed borrower, uint256 amount, uint256 duration);

    function createLoan(uint256 _amount, uint256 _interestRate, uint256 _duration, uint256 _collateralValue) external {
        require(_collateralValue >= _amount, "Insufficient collateral");

        uint256 loanId = uint256(keccak256(abi.encodePacked(msg.sender, block.timestamp)));

        loans[loanId] = Loan({
            borrower: msg.sender,
            amount: _amount,
            interestRate: _interestRate,
            duration: _duration,
            collateralValue: _collateralValue,
            createdAt: block.timestamp,
            repaidAt: 0,
            active: true
        });

        emit LoanCreated(loanId, msg.sender, _amount, _duration);
    }

    function repayLoan(uint256 _loanId) external payable {
        Loan storage loan = loans[_loanId];

        require(loan.active, "Loan not active");
        require(msg.value == loan.amount, "Incorrect repayment amount");

        payable(loan.borrower).transfer(msg.value);

        loan.repaidAt = block.timestamp;
        loan.active = false;
    }
}
