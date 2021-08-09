from itertools import count
from brownie import Wei, reverts
import requests
from web3 import HTTPProvider
import eth_abi
from brownie.convert import to_bytes
from brownie import (
    Contract,
    accounts,
    ZERO_ADDRESS,
    chain,
    rpc,
    web3,
    history,
    interface,
    Wei,
    ZERO_ADDRESS,
)

import random
import brownie

# TODO: Add tests here that show the normal operation of this strategy
#       Suggestions to include:
#           - strategy loading and unloading (via Vault addStrategy/revokeStrategy)
#           - change in loading (from low to high and high to low)
#           - strategy operation at different loading levels (anticipated and "extreme")

def test_operation(Caller,Callee,ms):
    # Callee.updateStrategyDebtRatio("0x6598d4366D5A45De4Bf2D2468D877E0b6436Ae76",200,{'from':ms})
    Caller.setDebtRatio("0x6598d4366D5A45De4Bf2D2468D877E0b6436Ae76",{'from':ms, "gas_price":8000000})
    assert False