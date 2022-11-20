# used to install nxlog on CADI network

# Set variables for program
set nxlog_install=nxlog-ce-3.1.2319.msi
set nxlog_conf=nxlog.conf

# copy install.msi and nxlog_install pwoershell script to local c:\ drive from shared location
echo y | copy \\flwldtest\VisiCad\1_TOOLS\Cyber\%nxlog_install% c:\%nxlog_install%
echo y | copy \\flwldtest\VisiCad\1_TOOLS\Cyber\nxlog_install.ps1 c:\nxlog_install.ps1

# wait for copy to complete
sleep 4 

# launch powershell to install nxlog
powershell.exe -noexit -file "c:\nxlog_install.ps1" 

# replace nxlog.conf with custom configuration
echo y | copy \\flwldtest\VisiCad\1_TOOLS\Cyber\%nxlog_conf% "C:\Program Files\nxlog\conf\%nxlog_conf%"

# wait 5 seconds to clean up
sleep 5

# remove copies of install from c drive
del "C:\nxlog-ce-3.1.2319.msi"
del "c:\nxlog_install.ps1" 
