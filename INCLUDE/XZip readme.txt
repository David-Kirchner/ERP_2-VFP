Zip Component
License: Freeware
Type: ActiveX dll
Vendor: Belus Technology

This component provides industry-standard Zip archive functionality. It is designed to be easy to use. You can pack/unpack a file or folder with a single line of code.

Documentation, API reference and examples are available at http://xstandard.com

**********************************
How to unzip files
<%
Dim objZip
Set objZip = Server.CreateObject("XStandard.Zip")
objZip.UnPack "C:\Temp\images.zip", "C:\Temp\"
Set objZip = Nothing
%>

How to archive (or zip) multiple files using wildcards
<%
Dim objZip
Set objZip = Server.CreateObject("XStandard.Zip")
objZip.Pack "C:\Temp\*.jpg", "C:\Temp\images.zip"
Set objZip = Nothing
%>