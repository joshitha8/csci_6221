#pragma version ^0.3.10
# @pragma evm-version paris

# Crowdfunding Smart Contract in Vyper

# State variables
owner: public(address)
goal: public(uint256)
deadline: public(uint256)
campaign_balance: public(uint256)  # Renamed to avoid collision

# Mapping to track each contributor's amount
contributions: public(HashMap[address, uint256])

# Events to log contributions, withdrawals, and refunds
event Contribution:
    contributor: indexed(address)
    amount: uint256

event Withdraw:
    amount: uint256
    recipient: address

event Refund:
    refunded_to: address
    amount: uint256

@external
def __init__(goal: uint256, duration: uint256):
    """
    Initializes the campaign with a funding goal and deadline.
    """
    self.owner = msg.sender
    self.goal = goal
    self.deadline = block.timestamp + duration
    self.campaign_balance = 0

@external
@payable
def contribute():
    """
    Allows users to contribute to the campaign.
    """
    assert block.timestamp < self.deadline, "Campaign is over"
    assert msg.value > 0, "Contribution must be greater than 0"

    # Track individual contributions
    self.contributions[msg.sender] += msg.value
    self.campaign_balance += msg.value

    log Contribution(msg.sender, msg.value)

@external
def withdraw():
    """
    Allows the campaign owner to withdraw funds if the goal is met.
    """
    assert msg.sender == self.owner, "Only the owner can withdraw"
    assert self.campaign_balance >= self.goal, "Funding goal not met"

    amount: uint256 = self.campaign_balance
    self.campaign_balance = 0  # Prevent reentrancy

    send(self.owner, amount)
    log Withdraw(amount, self.owner)

@external
def refund():
    """
    Allows contributors to get a refund if the campaign failed.
    """
    assert block.timestamp >= self.deadline, "Campaign is still active"
    assert self.campaign_balance < self.goal, "Goal was met, no refunds"

    amount: uint256 = self.contributions[msg.sender]
    assert amount > 0, "No contributions to refund"

    # Clear the contributor's balance to prevent reentrancy
    self.contributions[msg.sender] = 0

    send(msg.sender, amount)
    log Refund(msg.sender, amount)
