####################################
#    Primary Login Check Script    #
#						           #
# This file checkes	for valid      #
# user login and tellyscript       #
# challenge.  This is also 	       #
# assigned floating account names. #
#								   #
####################################


chop($qurey);




$TUN=getUserName($userssid,1);
print "*TUN* == $TUN ($userssid)\n";

if($TUN ne "AccountDisabled" && ($TUN)){
#Check to see if this box is authorized to login.  Otherwise its a bad boned tosed user.
if(isAtTerm($userssid)){
addToDB($MyLoc,8,"DamnFoolPayus20bucks");

$thingssentout=<<"ERIC"
<html>
<head>
<title>
Man, give us your lala
</title>
<display nostatus nooptions switchtowebmode
>
</head>
<body noscroll bgcolor="#191919" text="#42CC55" link="36d5ff"
hspace=0 vspace=0 fontsize="large"
>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=104 height=74 valign=middle align=center bgcolor="3B3A4D">
<img src="ROMCache/WebTVLogoJewel.gif" width=86 height=64>
<td width=20 valign=top align=left bgcolor="3B3A4D">
<img src="ROMCache/Spacer.gif" width=1 height=1>
<td colspan=10 width=436 valign=middle align=left bgcolor="3B3A4D">
<font color="D6DFD0" size="+2">
<blackface>
<shadow>
<img src="ROMCache/Spacer.gif" width=1 height=4>
<br>
Account Terminated
</shadow>
</blackface>
</font>
<tr>
<td colspan=12 width=560 height=10 valign=top align=left>
<img src="ROMCache/Shadow.gif" width=560 height=6>
<tr>
<td width=104 height=10 valign=top align=left>
<td width=20 valign=top align=left>
<td width=67 valign=top align=left>
<td width=20 valign=top align=left>
<td width=67 valign=top align=left>
<td width=20 valign=top align=left>
<td width=67 valign=top align=left>
<td width=20 valign=top align=left>
<td width=67 valign=top align=left>
<td width=20 valign=top align=left>
<td width=68 valign=top align=left>
<td width=20 valign=top align=left>
<form action="client:poweroff"
>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=9 width=100 height=258 valign=top align=left>
<font size=+1>
This account has been terminated due to exibiting a behavior that was against the TOS which you agreed to when you registered a account here.

<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=10 height=2 valign=middle align=center bgcolor="2B2B2B">
<img src="ROMCache/Spacer.gif" width=436 height=1>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=9 height=1 valign=top align=left>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=10 height=2 valign=top align=left bgcolor="0D0D0D">
<img src="ROMCache/Spacer.gif" width=436 height=1>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=9 height=4 valign=top align=left>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=9 width=416 valign=top align=left>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=306 valign=top align=left>
<font size="-1"><i>
</i></font><td width=112 valign=top align=right>
<font size="-1" color="#E7CE4A">
<shadow>
<input selected
name="Power Off"
value="Power Off"
type=submit Value=Continue name="Continue" borderimage="file://ROM/Borders/ButtonBorder2.bif" usestyle width=110>
</shadow>
</font>
</form>
</table>
<td width=20 valign=middle align=center>
</table>
</body>
</html>
ERIC
    ;

print $clients "200 OK\n";
print $clients "Connection: Keep-Alive\n";
print $clients "Expires: Wed, 09 Oct 1991 22:00:00 GMT\n";
print $clients "wtv-expire-all: wtv-head-waiter:\n";
print $clients "Content-length: ".length($thingssentout)."\n";
print $clients "Content-type text/html\n\n";
print $clients $thingssentout;




}else{

addToDB($MyLoc,8,"Demo");




print $clients "200 OK\n";
print $clients "Connection: Keep-Alive\n";
print $clients "Expires: Wed, 09 Oct 1991 22:00:00 GMT\n";
print $clients "wtv-expire-all: wtv-head-waiter:\n";
print $clients "wtv-service: name=wtv-log host=$sockhost port=$sockport flags=0x00000001 connections=1\n";
print $clients "wtv-service: name=wtv-log host=$sockhost port=$sockport flags=0x00000001 connections=1\n";
print $clients "wtv-log-url: wtv-log:/log\n";
if(!($qurey)){
print $clients "wtv-challenge: hHh87xmvkEbPTXj1jzFNZvcRCnhBo0HWjA+FXW9pVnPnEbkxWaNULTyR6DA9dwNOYthN9Y1X3QBcumPNC54Z4zr9elgX1bOXz908PSpgU6ScrPRKcCqLZII/R13HRcMSCOPD0xL+pI5SmvkPE/SpKQ==\n";
}
print $clients "wtv-relogin-url: wtv-head-waiter:/login?relogin=true\n";
print $clients "wtv-reconnect-url: wtv-head-waiter:/reconnect\n";
print $clients "wtv-visit: wtv-head-waiter:/login-stage-two?$qurey\n";
print $clients "Content-length: 0\n";
print $clients "Content-type: text/html\n\n";

}


}else{
addToDB($MyLoc,8,"AccountDisabled");

$thingssentout=<<"ERIC"
<html>
<head>
<title>
Please call
</title>
<display nostatus nooptions switchtowebmode
>
</head>
<body noscroll bgcolor="#191919" text="#42CC55" link="36d5ff"
hspace=0 vspace=0 fontsize="large"
>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=104 height=74 valign=middle align=center bgcolor="3B3A4D">
<img src="ROMCache/WebTVLogoJewel.gif" width=86 height=64>
<td width=20 valign=top align=left bgcolor="3B3A4D">
<img src="ROMCache/Spacer.gif" width=1 height=1>
<td colspan=10 width=436 valign=middle align=left bgcolor="3B3A4D">
<font color="D6DFD0" size="+2">
<blackface>
<shadow>
<img src="ROMCache/Spacer.gif" width=1 height=4>
<br>
Please call
</shadow>
</blackface>
</font>
<tr>
<td colspan=12 width=560 height=10 valign=top align=left>
<img src="ROMCache/Shadow.gif" width=560 height=6>
<tr>
<td width=104 height=10 valign=top align=left>
<td width=20 valign=top align=left>
<td width=67 valign=top align=left>
<td width=20 valign=top align=left>
<td width=67 valign=top align=left>
<td width=20 valign=top align=left>
<td width=67 valign=top align=left>
<td width=20 valign=top align=left>
<td width=67 valign=top align=left>
<td width=20 valign=top align=left>
<td width=68 valign=top align=left>
<td width=20 valign=top align=left>
<form action="client:poweroff"
>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=9 width=100 height=258 valign=top align=left>
<font size=+1>
Your Internet terminal needs to be replaced before you can connect to WebTV. Call the number for your Internet terminal's manufacturer:
</font>
<font size=-2>
<p>
Philips Magnavox at 1-888-813-7069
<p>
Sony at 1-888-772-7669
<P>
Mitsubishi at 1-800-332-2119
<P>
Samsung at 1-800-726-7864
<P>
RCA/Thomson at 800-722-9599
</font>
</font>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=10 height=2 valign=middle align=center bgcolor="2B2B2B">
<img src="ROMCache/Spacer.gif" width=436 height=1>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=9 height=1 valign=top align=left>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=10 height=2 valign=top align=left bgcolor="0D0D0D">
<img src="ROMCache/Spacer.gif" width=436 height=1>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=9 height=4 valign=top align=left>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=9 width=416 valign=top align=left>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=306 valign=top align=left>
<font size="-1"><i>
</i></font><td width=112 valign=top align=right>
<font size="-1" color="#E7CE4A">
<shadow>
<input selected
name="Power Off"
value="Power Off"
type=submit Value=Continue name="Continue" borderimage="file://ROM/Borders/ButtonBorder2.bif" usestyle width=110>
</shadow>
</font>
</form>
</table>
<td width=20 valign=middle align=center>
</table>
</body>
</html>
ERIC
    ;

print $clients "200 OK\n";
print $clients "Connection: Keep-Alive\n";
print $clients "Expires: Wed, 09 Oct 1991 22:00:00 GMT\n";
print $clients "wtv-expire-all: wtv-head-waiter:\n";
print $clients "Content-length: ".length($thingssentout)."\n";
print $clients "Content-type text/html\n\n";
print $clients $thingssentout;

}




