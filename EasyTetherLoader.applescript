property pw : ""
property clamshellwake_path : "/tmp/EasyTetherUSBEthernet.kext"
property adb_path : "/opt/android/platform-tools/adb"

--kextload on launch
on run
	if pw = "" then my save_password()
	my init_root_wheel()
	my kextload(clamshellwake_path)
	display dialog "kext loaded." buttons {"OK"} default button "OK" with title "EasyTetherUSBEthernet.kext" with icon note giving up after 1
end run

--password change from Dock
--on reopen
--	my save_password()
--end reopen

--kextunload on end
on quit
	if my kextstat() then
		if pw = "" then my save_password()
		my kextunload(clamshellwake_path)
	end if
	display dialog "kext unloaded." buttons {"OK"} default button "OK" with title "EasyTetherUSBEthernet.kext" with icon note giving up after 1
	tell application "System Events" to keystroke tab using {command down} --fast cleanup
	continue quit
end quit



on save_password()
	activate
	display dialog "Admin Password:" default answer "" with hidden answer
	set pw to result's text returned
end save_password

on init_root_wheel()
	try
		do shell script "rm -R " & clamshellwake_path password pw with administrator privileges
	end try
	do shell script "cp -R " & my bundle_path("Resources/EasyTetherUSBEthernet.kext") & " /tmp" password pw with administrator privileges
	do shell script "chown -R root:wheel " & clamshellwake_path password pw with administrator privileges
end init_root_wheel

on bundle_path(in_path)
	(path to me)'s POSIX path & "Contents/" & in_path
end bundle_path

on kextload(kext_path)
	try
		do shell script adb_path & " kill-server" password pw with administrator privileges
	end try
	do shell script "kextload " & kext_path password pw with administrator privileges
end kextload

on kextunload(kext_path)
	do shell script "kextunload " & kext_path password pw with administrator privileges
end kextunload

on kextstat()
	try
		do shell script "kextstat|grep com.mobile-stream.driver.EasyTetherUSBEthernet"
		true
	on error
		false
	end try
end kextstat
