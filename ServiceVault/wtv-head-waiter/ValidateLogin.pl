chop($qurey);
@valueArray=split(/\&/,$qurey);
$ReloginProne=0;
$FlashProne=0;
$DDProne=0;
$MWProne=0;

foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);
$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
#not going to bother with the other attributes, they have no concern over me.

if($namem eq "relogin"){
$ReloginProne=$valuem;
}

if($namem eq "lc2flash"){
$FlashProne=$valuem;
}

if($namem eq "DataDownload"){
$DDProne=$valuem;
}

if($namem eq "MessageWatch"){
$MWProne=$valuem;
}

if($namem eq "ForceRegistration"){
$ForceReg=$valuem;
}

}

if($TUN ne "AccountDisabled" && ($TUN)){

$passwordtxt=getUserFile($userssid,"Preferences/Pass.txt");
chop($passwordtxt) if $passwordtxt=~/\n/;

if($passwordtxt){
$tosendout=<<"ERIC"

<html><HEAD><title>Password</title> 
<DISPLAY noscroll nooptions nostatus switchtowebmode> </HEAD> <sidebar width=144> <table cellspacing=0 cellpadding=0 bgcolor="30364D"> <tr> <td width=138 absheight=109 valign=top align=center> <img src="ROMCache/Spacer.gif" width=1 height=8><br> <img src="ROMCache/Spacer.gif" width=7 height=1><img src="ROMCache/WebTVLogoJewel.gif" width=127 height=98> <td rowspan=99 width=6 absheight=420 valign=top align=left> <img src="ROMCache/Shadow.gif" width=6 height=420> <tr> <td absheight=5> 
<table cellspacing=0 cellpadding=0> 
<tr><td abswidth=138 absheight=2 valign=middle align=center bgcolor="1C1E28"> <img src="ROMCache/Spacer.gif" width=1 height=1> <tr><td abswidth=138 absheight=1 valign=top align=left> <tr><td abswidth=138 absheight=2 valign=top align=left bgcolor="4D5573"> <img src="ROMCache/Spacer.gif" width=1 height=1> </table> <tr> 
<td absheight=106>
<tr>
<td align=right> 
<img src="images/PasswordBanner.gif" width=50 height=191> <tr> <td absheight=8> 
</table>
</sidebar>
<body background="images/NameStrip.gif"
novtilebg
nohtilebg
bgcolor=191919 
text="AA9B4A" link=189cd6 vlink=189cd6 hspace=0 fontsize="large"> <form action=/ValidateLoginName enctype="x-www-form-encoded" method=post> <input type="hidden" NAME="target-url" VALUE=""> <table cellspacing=0 cellpadding=0> 
<tr>
<td width=20>
<td valign=center absheight=104> 
<font size="+1" color="E7CE4A"><blackface><shadow> Type your password </shadow></blackface> 
<tr>
<td> 
<td bgcolor=2b2b2b abswidth=400 absheight=2> <img src="ROMCache/Spacer.gif" width=1 height=1> <tr> <td> 
<td absheight=1>
<tr>
<td> 
<td bgcolor=000000 abswidth=400 absheight=2> <img src="ROMCache/Spacer.gif" width=1 height=1> <tr> <td> 
<td height=125 valign=center>
<font size=+1 color=42bd52>Password 
<img src="ROMCache/Spacer.gif" width=4 height=1> <input type=password size=26 name="password" bgcolor=#444444 text=#ffdd33 cursor=#cc9933 id="password" selected 
<input type=hidden name="user-id" id="user-id" value=[BLAH]> <tr> <td> 
<td>
<tr>
<td> 
<td bgcolor=1e1e1e abswidth=400 absheight=2> <img src="ROMCache/Spacer.gif" width=1 height=1> <tr> <td> 
<td absheight=1>
<tr>
<td> 
<td bgcolor=121212 abswidth=400 absheight=2> <img src="ROMCache/Spacer.gif" width=1 height=1> <tr> <td height=8> 
<tr>
<td>
<td align=right width=100%> 
<font COLOR="#E7CE4A" SIZE=-1><shadow><input type=submit borderimage="file://ROM/Borders/ButtonBorder2.bif" value="Continue" 
usestyle>
</shadow></font> 
<img src="ROMCache/Spacer.gif" width=20 height=1> </table>
</form> 
</body>
</html>

ERIC
    ;


print $clients "200 OK\n";
print $clients "Connection: Keep-Alive\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;
}else{
print $clients "200 OK\n";
print $clients "Connection: Keep-Alive\n";
print $clients "wtv-visit: wtv-head-waiter:/ValidateLoginName?user-id=[ThisServerIsNotGoingToUseUIDs]\n";
print $clients "Content-length: 0\n";
print $clients "Content-type: text/html\n\n";
}
}