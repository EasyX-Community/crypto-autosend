# crypto-autosend v1.0.3

#### Description:
Automatically check walletd for coins and send all to specified address. Featuring a new installer. Linux only.

Used for auto sending Raptoreum/RTM to INodez onboarding address - so you can keep mining to desktop wallet :)

Could also be repurposed for other crypto's that have sendtoaddress RPC function. If your coind does not have the sendtoaddress function you can modify it to use a different send function. You'll be on your own for that, good luck!

#### Changelog:
- Added path to CLI as config variable fixing bug where script does not know where cli is located

### Disclaimer:
**I am not liable in any way for damages to your computer or lost funds due to bugs, being hacked, exploited, or any other malfunction of the scripts. Having a script that automatically sends all of your cryptocurrency to an address is inherently dangerous and can be exploited for malicious purposes. Please be advised of the risks and ensure the receiving address is the correct address before setting this script up to send to it. This source code is open, it is your responsibility to audit the code.**

#### Requirements:
- Some coind running on some machine configured with LAN IP as host, some port, some user, and some password

#### Notes:
- It is important the instructions are completed in order
- Read the notes about [cronjobs](#cronjobs) before installing
- Do not delete the git repository directory, it installs in it's place

#### Setup:
1. `cd /opt`
2. `git clone https://gogs.easyx.cc/EasyX-Community/crypto-autosend.git`
3. `cd crypto-autosend`
4. `./install_crypto-autosend.sh`
5. `source ~/.bashrc`

#### Updating (manual):
1. `crypto-autosend-update`

#### Cronjobs:
The installer will ask if you want it to install cronjob for you. It will also ask if you want it to install a weekly update cronjob for you.

It is advised you select **'yes'** and then if you want to change it you can use `crontab -e` later.

If you are unsure about crontab times, this calculator will come in handy [https://crontab.guru/](https://crontab.guru/)

#### Coming features:
- Can't think of any at the moment, but please create GitHub or Gogs issue ticket if you have any suggestions.


#### Donations:
**XMR:** 84wwa7EKo8uasZAHijHKtBTuBaMPuNjCJgnfGJrsLFo4aZcfrzGvUX33sSeFNdno8fPiTDGnz4h1bCvsdFQYWRuR2619FzS <br />
**ETH(ERC-20):** 0xc89eEa9b5C0cfa7f583dc1A6405a7d5730ADB603 <br />
**BNB(BSC)** 0xc89eEa9b5C0cfa7f583dc1A6405a7d5730ADB603 <br />
**RTM:** RDg5KstHYvxip77EiGhPKYNL3TZQr6456T <br />
**AVN:** R9zSPpKjo6tCutMT5FyyGNr2vRaAssEtrm <br />
**PHL:** F7XaUosKYEXPP62o31DdpDoADo3VcxoFP4 <br />
**PEXA:** XBghzGLdeUzspUcJpeggPFLs3mAyTRHpPH <br />
