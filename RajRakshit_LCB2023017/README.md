Title : CrowdFunding Smart Contract

Functionaity :
This contract has functions required to ensure funding in a samrt contract. We set the owner, the target, mapping named funding and the total funds.
Then we specify three events namely:

Fund : Here we do get the address of the person who is sending the funds as well as the amount of funds sent by the user.

FundingSuccessful : This event has the total funds and when emited would provide the total funds collected.

FundingFailed : This event is also present to emit the total funds even if the funding failed.

Then we use a constructor where we set the owner as well as specify the target value.

Then we provide three functions namely : getFunds, addFunds and getBalance.

getFunds : This is used to withdraw the funds from the contract.

addFunds : this allows any user to add funds.

get balance : this returns the balance contributed by a particular address