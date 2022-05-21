# crypto-autosend v1.0.4

#### Description:
Automatically check walletd for coins and send all to specified address. Featuring a new installer. Linux only.

Used for auto sending Raptoreum/RTM to INodez onboarding address - so you can keep mining to desktop wallet :)

Could also be repurposed for other crypto's that have sendtoaddress RPC function. If your coind does not have the sendtoaddress function you can modify it to use a different send function. You'll be on your own for that, good luck!

### Disclaimer:
**I am not liable in any way for damages to your computer or lost funds due to bugs, being hacked, exploited, or any other malfunction of the scripts. Having a script that automatically sends all of your cryptocurrency to an address is inherently dangerous and can be exploited for malicious purposes. Please be advised of the risks and ensure the receiving address is the correct address before setting this script up to send to it. This source code is open, it is your responsibility to audit the code.**

#### Notes:
- It is important the instructions are completed in order
- Read the notes about [cronjobs](#cronjobs) before installing
- Do not delete the git repository directory, it installs in it's place

#### Changelog:
- Added path to CLI as config variable fixing bug where script does not know where cli is located

#### Requirements:
- Some coind running on some machine configured with LAN IP as host, some port, some user, and some password

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

#### Official Repositories:
Some sources will be under the user profile for mooleshacat/moocat and some will be under EasyX-Community. The following are the locations in which you can find the official source code of this repository:
- https://gogs.easyx.cc/EasyX-Community/ (Main Repository)
- https://github.com/EasyX-Community/ (Mirror)
- https://gitlab.com/e3074 (Mirror)
- https://codeberg.org/EasyX-Community/ (Mirror)
- https://bitbucket.org/easyx-community/ (Mirror)
- https://sourceforge.net/u/easyx-community/profile/ (Mirror)
- https://codegiant.io/mooleshacat/easyx-community (Mirror)

If you have downloaded or cloned the source from anywhere else, you may have a copy that has been modified in malicious ways!

Please be sure only to use the above sources!


#### Donations:
**XMR:** 41tsd6TiQouPJN5cjERKjL6kE5fXcdUrr4uoRrYyfLFCZJumDXpipiERNtVq2DSaUjeAEaDjdDbs15YTNUYRqhkdE83x4PE <br />
**BTC:** bc1qffd7j4jdspfjc8mr05g8yqfncjfdnzamec53tr <br />
**ETH(ERC-20):** 0x784207DC134B61E0bD7edA658aa830e8FD12A7c7 <br />
**LTC:** ltc1q8afdasd2qanphs82rqvetzu8yrk2kq6y4fqvrn <br />
**BNB(BSC)** 0xc89eEa9b5C0cfa7f583dc1A6405a7d5730ADB603 <br />
**RTM:** RDg5KstHYvxip77EiGhPKYNL3TZQr6456T <br />
**AVN:** R9zSPpKjo6tCutMT5FyyGNr2vRaAssEtrm <br />
**PHL:** F7XaUosKYEXPP62o31DdpDoADo3VcxoFP4 <br />
**PEXA:** XBghzGLdeUzspUcJpeggPFLs3mAyTRHpPH <br />
