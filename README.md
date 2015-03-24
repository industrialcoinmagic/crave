
Crave development tree

Crave is a PoS-based cryptocurrency.

CRAVE is dependent upon libsecp256k1 by sipa, the sources for which can be found here:
https://github.com/bitcoin/secp256k1

Total POW: 10,000 Blocks
POW Reward: 100 CRAVE per Block
POS Reward: 1 CRAVE (HiPOS)
Block Spacing: 60 Seconds
Diff Retarget: 24 Blocks
Maturity: 188 Blocks
Stake Minimum Age: 8 Hours

40 MegaByte Maximum Block Size (40X Bitcoin Core)

Port: 30104
RPC Port: 30105

Magic Bytes: 0x1f 0x22 0x05 0x31

CRAVE includes an Address Index feature, based on the address index API (searchrawtransactions RPC command) implemented in Bitcoin Core but modified implementation to work with the CRAVE codebase (PoS coins maintain a txindex by default for instance).

Initialize the Address Index By Running with -reindexaddr Command Line Argument.  It may take 10-15 minutes to build the initial index.


