$midtahl="";
splice(@FavData);
$tosendout="";
$stuff=getUserFile($userssid,"Favorites/FavData.txt");
foreach  (@tidly){
chop;
if($_){
$CXZ=substr($_,0,index($_," "));

if($CXZ ne "FolderCount:"){
push(@FavData,$_);
}

}
}

@FavData=sort(@FavData);
if(!($FavData[1])){


print $clients "300 OK\n";
print $clients "wtv-expire-all: wtv-favorite\n";
print $clients "Content-length: 0\n";
print $clients "Content-Type: text/html\n";
print $clients "Location: wtv-favorite:/favorite\n\n";

}else{
foreach (@FavData){


$midtahl.=<<"ERIC"
<tr><td align="center">
<font color="#E6CD4A" size=-1><shadow>
<input
type=submit borderimage="file://ROM/Borders/ButtonBorder2.bif" value="Remove $_" name="Discard$_" usestyle width=80%>
</shadow></font>
</td></tr>

ERIC
    ;
}


$tosendout=<<"ERIC"
<HTML>
<HEAD>
<TITLE>
Remove a folder
</TITLE>
<DISPLAY>
</HEAD>
<BODY BGCOLOR=191919 TEXT=44cc55 LINK=189cd6 VLINK=189cd6 HSPACE=0 VSPACE=0 FONTSIZE=large>
<sidebar width=109 height=384>
<tr><td absheight=384>
<table cellspacing=0 cellpadding=0 bgcolor=284a52>
<tr><td valign=top absheight=196>
<table cellspacing=0 cellpadding=0 absheight=196>
<tr>
<td valign=top width=100% height=50%>
<table cellspacing=0 cellpadding=0>
<tr>
<td colspan=3 width=100% absheight=1>
<tr>
<td abswidth=6>
<td width=100% align=center absheight=79>
<table href="wtv-home:/home" width=100% absheight=79 cellspacing=0 cellpadding=0>
<tr>
<td width=100% align=center>
<img src="wtv-home:/ROMCache/WebTVLogoJewel.gif" width=87 height=67>
</table>
<td abswidth=5>
<tr><td colspan=3 width=100% absheight=2 bgcolor=1f3136>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td colspan=3 width=100% absheight=1>
<tr><td colspan=3 width=100% absheight=2 bgcolor=436f79>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>	</table>
</table>
<td abswidth=5 background="ROMCache/Shadow.gif"><img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td valign=top absheight=188>
<table cellspacing=0 cellpadding=0 absheight=188>
<tr><td width=100%><img src="wtv-home:/ROMCache/Spacer.gif" width=100% height=1>
<td align=right valign=bottom><img src="ROMCache/FavoritesBanner.gif" width=50 height=188>
</table>
<td abswidth=5 background="ROMCache/Shadow.gif"><img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>
</sidebar>
<table cellspacing=0 cellpadding=0 bgcolor=191919>
<tr><table cellspacing=0 cellpadding=0>
<td abswidth=19>
<td><table cellspacing=0 cellpadding=0>
<tr><table cellspacing=0 cellpadding=0>
<tr><td absheight=16><img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td><table cellspacing=0 cellpadding=0>
<tr><td align=left>
<shadow><blackface><font color=e7ce4a>
Remove a folder
</font><blackface><shadow>
</table>
<tr><td height=18><img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>
</shadow></blackface>
</table>
<tr><table cellspacing=0 cellpadding=0>
<td abswidth=19>
<td><table cellspacing=0 cellpadding=0>
<tr><td absheight=0>
<tr><td>
<font size=-1>
Click one of the buttons below to remove a folder then choose <b>Continue</b>.<br>
<br>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=18>
</font>
</td></tr>
</table>

<table cellspacing=3 cellpadding=3>
<tr><td absheight=0>
<form action="wtv-favorite:/commit-discard-folder">

$midtahl
</table>
<table cellspacing=0 cellpadding=0>
<tr><td absheight=35>
<tr><td width=436 absheight=2 bgcolor=2b2b2b> <img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td width=1 height=1><img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td width=436 absheight=2 bgcolor=0d0d0d> <img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td absheight=35>
<tr><td align="right">
<form action="wtv-favorite:/favorite">
<font color="#E6CD4A" size=-1><shadow>
<input
type=submit borderimage="file://ROM/Borders/ButtonBorder2.bif" value="Continue" name="Continue" usestyle>
</shadow></font>

</td></tr>


</table>
</table>
</table>
</table>
</BODY>
</HTML>


ERIC
    ;



print $clients "200 OK.\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;
}
