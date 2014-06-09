#!/bin/sh
set -e
if [ -d EasyTetherLoader.app ]; then
	curl -O http://www.mobile-stream.com/beta/easytether.dmg
	7z e easytether.dmg 0.hfs
	7z e 0.hfs EasyTether/EasyTetherUSBEthernet.pkg/Contents/Archive.pax.gz
	tar xzf Archive.pax.gz -C EasyTetherLoader.app/Contents/Resources/
	rm easytether.dmg 0.hfs Archive.pax.gz
	osacompile -o EasyTetherLoader.app/Contents/Resources/Scripts/main.scpt EasyTetherLoader.applescript
	echo "Successfully installed EasyTetherUSBEthernet.kext"
else
	echo "EasyTetherLoader.app not found"
fi
