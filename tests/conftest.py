import pytest
from brownie import config
from brownie import network
from web3 import HTTPProvider
import requests
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

@pytest.fixture
def ms(accounts):
    # fork_base_url = "https://simulate.yearn.network/fork"
    # fork_id = requests.post(fork_base_url, headers={}, json={"network_id": "1"}).json()['simulation_fork']['id']
    # fork_url = f"{fork_base_url}/{fork_id}"
    # fork_rpc_url = f"https://rpc.tenderly.co/fork/{fork_id}"
    # print(fork_id)
    # web3.provider = HTTPProvider(fork_rpc_url, {"timeout": 600})
    yield accounts.at("0x16388463d60FFE0661Cf7F1f31a7D658aC790ff7", force=True)

@pytest.fixture
def Caller(Caller,ms):
    yield Caller.deploy({'from': ms})

@pytest.fixture
def Callee(Callee,ms):
    yield Callee.deploy({'from': ms})

