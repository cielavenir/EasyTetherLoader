# EasyTetherLoader

## Abstract
* In usual EasyTether installation, EasyTetherUSBEthernet.kext is loaded on startup.
* This is problematic if you want to use adb (and other adb based programs).
* klink doesn't have such limitation (and I also recommend it), but some of you might have already bought EasyTether.
* Using this application as workaround, you can load EasyTetherUSBEthernet.kext only when you want.

## Automated Installer
* Prepare p7zip-full (it uses 7-zip's dmg/hfs unpacker).
* Clone this repository.
* Chdir to the repository directory.
* Launch install.sh and it will prepare EasyTetherUSBEthernet.kext and main.scpt.

## Manual Installation
* Download EasyTether OSX installer (Don't install it).
* Open easytether.dmg and copy EasyTetherUSBEthernet.pkg to Desktop.
* Extract EasyTetherUSBEthernet.pkg using unpkg (http://www.timdoug.com/unpkg/).
* Open contents of EasyTetherLoader.app and move EasyTetherUSBEthernet.kext to Contents/Resources/.
* Create EasyTetherLoader.app/Contents/Resources/Scripts/main.scpt using osacompile.

## Configuration
* The source code is stored in EasyTetherLoader.applescript.
* Open it with AppleScript Editor and edit pw and adb_path.
* ADB must be shut down before loading EasyTetherUSBEthernet.kext. EasyTetherLoader will "adb_path kill-server" automatically.

## License
* Fair License
* Usage of the works is permitted provided that this instrument is retained with the works, so that any entity that uses the works is notified of this instrument.
* DISCLAIMER: THE WORKS ARE WITHOUT WARRANTY.

## Acknowledgement
* ClamshellWake
* http://d.hatena.ne.jp/zariganitosh/20110726/clamshell_wake_kext
* https://github.com/zarigani/ClamshellWake
