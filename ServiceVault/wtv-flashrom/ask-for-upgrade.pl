$afug="";

chop($qurey);
@valueArray=split(/\&/,$qurey);
$ReloginProne=0;
foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);
$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

if($namem eq "version"){
$afug=$valuem;
}


}


$tosendout=<<"ERIC"
<html>
<head>
<display switchtowebmode nooptions nostatus skipback clearback>
<title>New Update Availible</title>
</head>
<body bgcolor="#191919" text="#42CC55" link="36d5ff" fontsize="large"
hspace=0 vspace=0>
<table cellspacing=0 cellpadding=0>
<tr><td width=104 height=74 valign=middle align=center bgcolor="3B3A4D">
<img src="file://ROMCache/WebTVLogoJewel.gif" width=86 height=64>
<td width=20 valign=top align=left bgcolor="3B3A4D">
<img src="file://ROMCache/Spacer.gif" width=1 height=1>
<td colspan=10 width=436 valign=middle align=left bgcolor="3B3A4D">
<font color="D6DFD0" size="+2"><blackface><shadow>
<img src="file://ROMCache/Spacer.gif" width=1 height=4>
<br>
New update Availible
</shadow>
</blackface>
</font>
<tr>
<td colspan=12 width=100% height=10 valign=top align=left>
<img src="file://ROMCache/S40H1.gif" width=560 height=6>
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
<tr>
<td colspan=11 width=540 height=258 valign=top align=left>
<table cellspacing=0 cellpadding=0>
<tr>
<td colspan=2 width=124 valign=top align=left>
<td colspan=2 width=416 valign=top align=left>
<font size=+1>
Hey EricSrv	has a update availible that will blow your tummy apart.  Its exacty what you where wating for--Nothing.  Yes, nothing you will have the same build you have now.  No more bugs, no more problems, no more blocks the greatest ever thought out upgrade here at EricSrc networks!  Enjoy!!!

<tr><td height=120>
<tr><td colspan=2>
<td colspan=99 abswidth=436 absheight=2 bgcolor=2B2B2B>
<img src="wtv-flashrom:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td absheight=1>
<tr><td colspan=2>
<td colspan=99 abswidth=436 absheight=2 bgcolor=0D0D0D>
<img src="wtv-flashrom:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td height=7>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=9 width=416 valign=top align=left>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=306 valign=top align=right>	<td width=20>
<td width=112 valign=top align=right>
<form action="wtv-flashrom:/relogin?noflash=true">
<FONT COLOR="#E7CE4A" SIZE=-1><input type="Submit" value="Continue" BORDERIMAGE="file://ROM/Borders/ButtonBorder2.bif" usestyle
selected></font>
<input type="Hidden" name="version" value="$afug">
</form>
</table>
</body>
</html>
ERIC
    ;

print $clients "200 OK.\n";
print $clients "Connection: Keep-Alive\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type text/html\n\n";
print $clients $tosendout;