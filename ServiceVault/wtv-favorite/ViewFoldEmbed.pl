$HTMLcont="";
$FolderName="";
$FavCURL="LeftTop.gif";
$BrocHTML="";
$NextURLC="FarRightTop.gif";

chop($qurey);
@valueArray=split(/\&/,$qurey);


foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);


$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;


if($namem eq "folder"){
$FolderName=$valuem;
}


}
$ThisfolderCount="";
splice(@FavData);
$stuff=getUserFile($userssid,"Favorites/FavData.txt");
$Counta_x=0;
foreach  (@tidly){
chop;

if($_){
$CXZ=substr($_,0,index($_," "));
if($CXZ ne "FolderCount:"){
if($_ eq $FolderName){
$ThisfolderCount=$Counta_x;
}
push(@FavData,$_);
$Counta_x++;
}

}

}

$Concur=$ThisfolderCount-1;
if($FavData[$Concur]){
$BrocHTML=<<"ERIC"
<td width=20 height=28 align=left valign=top>
<table cellspacing=0 cellpadding=0>
<tr><td height=1>
<tr><td height=20>
<table width=20 height=20 cellspacing=0 cellpadding=0 href="wtv-favorite:/serve-browser?favorite-folder-name=$FavData[$Concur]&backward=selected" >
<td>&nbsp
</table>
</table>
ERIC
    ;
$FavCURL="LeftTopWithPreviousTab.gif";
}
$Concur=$ThisfolderCount+1;
if($FavData[$Concur]){

$NextURLC="FarRightTopWithNextTab.gif";

}


if(open(FILE,"< UserDataBase/Users/$username/Favorites/$FolderName/origanized-.txt")){
sysread(FILE,$stuff,-s FILE,0);
@tidly=split(/\n/,$stuff);
close(FILE);
$countZX=0;
foreach  (@tidly) {
$countZX++;
($FavTitle,$FavURL,$FavThumb)=split(/\x00/,$_);
$HTMLcont.="<table href=\"$FavURL\" >
<tr><td abswidth=139 align=center>
<img vspace=5 src=\"wtv-favorite:/Thumbnails/$FavThumb.bmp?folder=$FolderName\" width=70 height=52><br>
<table cellspacing=0 cellpadding=0>
<tr><td align=center maxlines=2><font size=-1>
$FavTitle
<br>
</font>
</table>
</table>";

if(!($countZX%4)){
$HTMLcont.="<tr><td width=5 absheight=106><img src=\"wtv-home:/ROMCache/Spacer.gif\" width=1 height=1>
<td width=15>
<td abswidth=139 valign=top>
";

}else{
$HTMLcont.="<td abswidth=139 valign=top>";

}
}

$username=getUserName($userssid);
$HTMLcontX=<<"ERIC"

<HTML>
<HEAD>
<TITLE>
Favorites for $username
</TITLE>
<DISPLAY
>
</HEAD>
<body bgcolor="#26171A" text="#D2D2D3" link="#FFE99B" vlink="#FFE99B" fontsize="medium" vspace=0 hspace=0>
<sidebar width=109 height=384>
<tr><td absheight=384>
<table cellspacing=0 cellpadding=0 bgcolor=#3C343D>
<tr><td valign=top absheight=196>
<table cellspacing=0 cellpadding=0 absheight=196>
<tr>
<td valign=top width=100% height=50%>
<table cellspacing=0 cellpadding=0>
<tr>
<td height=1>
<tr>
<td width=6>
<td width=100% align=center absheight=79>
<table href="wtv-home:/home" width=100% absheight=79 cellspacing=0 cellpadding=0>
<tr>
<td width=100% align=center>
<img src="wtv-home:/ROMCache/WebTVLogoJewel.gif" width=87 height=67>
</table>
<td width=5>
<tr><td colspan=3 width=100% absheight=2 bgcolor=#6C676B>
<img src="wtv-home:/ROMCache/Spacer.gif" width=104 height=1>
<tr><td width=93 colspan=3>
<table cellspacing=0 cellpadding=0>
<tr><td abswidth=5 absheight=26>
<td abswidth=93><table abswidth=93 cellspacing=0 cellpadding=0 href="wtv-favorite:/serve-folders?favorite-folder-name=Personal">
<tr><td>
<table cellspacing=0 cellpadding=0>
<tr><td><shadow><font color=E7CE4A>
&nbsp;Folders
</table>
</table>
<td abswidth=6>
<tr><td colspan=3 width=104 absheight=2 bgcolor=#6C676B>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>
<tr><td width=93 colspan=3>
<table cellspacing=0 cellpadding=0>
<tr><td abswidth=5 absheight=26>
<td abswidth=93><table abswidth=93 cellspacing=0 cellpadding=0 href="wtv-favorite:/serve-organize-favorites?favorite-folder-name=Personal">
<tr><td>
<table cellspacing=0 cellpadding=0>
<tr><td><shadow><font color=E7CE4A>
&nbsp;Organize
</table>
</table>
<td abswidth=6>
<tr><td colspan=3 width=104 absheight=2 bgcolor=#6C676B>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>
<tr><td width=93 colspan=3>
</table>
</table>
<td abswidth=5 bgcolor=#726267>
<tr><td valign=top absheight=188>
<table cellspacing=0 cellpadding=0 absheight=188>
<tr><td width=100%><img src="wtv-home:/ROMCache/Spacer.gif" width=100% height=1>
<td align=right valign=bottom>
</table>
<td abswidth=5 bgcolor=#726267>
</table>
</sidebar>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=451 colspan=2 align=center bgcolor=#726267>
<spacer type=vertical size=13>
<tr>
<td height=8 bgcolor=#544447 colspan=2>
<img src="wtv-favorite:/images/CornerTop.gif" width=8 height=8>
<tr>
<td bgcolor=#544447 width=13>
<spacer type=horizontal size=13>
<td bgcolor=#544447 width=438 valign=top>
<table cellspacing=0 cellpadding=0 width=438 border=0 transparency=50>
<tr>
<td height=60>
<img src="wtv-favorite:/images/Favorites.gif" width=202 height=46>
<img src=wtv-home:/ROMCache/TreasureChest1.gif width=75 height=42 transparency=50%>
<td width=128 valign=middle>
</table>
<tr>
<td colspan=2>
<table cellspacing=0 cellpadding=0 bgcolor=#3C343D>
<tr>
<td width=451 absheight=25>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=13 absheight=25>
<spacer type=horizontal size=13>
<td width=370 maxlines=1>
<font sizerange=medium color=#D6D6D6><blackface>	Favorites for $username
</blackface></font>
<td width=21>
<img src="wtv-favorite:/images/help-arrow.gif" width=16 height=16>
<td width=34>
<spacer type=vertical size=1><br>
<a href="wtv-guide:/help?topic=Favorites&subtopic=Index&appName=Favorites"><font sizerange=small color=#E6CD4A><b>Help</b></font></a>
<td width=13>
<spacer type=horizontal size=13>
</table>
</table>
<tr>
<td colspan=2 height=4 bgcolor=#544447>
</table>
<table cellspacing=0 cellpadding=0>
<tr><td align=left valign=top>




<td align=left valign=top>




<table cellspacing=0 cellpadding=0 width=221>
<tr><td width=221 height=42 align=left valign=middle background="ROMCache/$FavCURL" LeftTop.gif>
<table width=100% cellspacing=0 cellpadding=0>


<tr><td width=10>
$BrocHTML


<td width=10> <td align=center height=20>
<font size=-1 color=#E6CD4A>
<limittext value="$FolderName" width=140>
</font>
<td width=20>
</table>
</table>
<td valign=top align=left>
<table cellspacing=0 cellpadding=0>
<tr><td>


<table cellspacing=0 cellpadding=0 abswidth=178>
<tr><td absheight=20 bgcolor=#544447>&nbsp;
<tr><td abswidth=178 height=22 align=left valign=middle background="images/MiddleTop.gif">
</table>
<td>
 
<table cellspacing=0 cellpadding=0 abswidth=52>
<tr><table cellspacing=0 cellpadding=0 abswidth=52 background="ROMCache/$NextURLC">
<td width=20 height=42 align=left valign=middle>
<td width=25 height=42 align=left valign=middle>
<td width=7 height=40 align=left valign=middle>
</table>
</table>
</table>
<tr><table cellspacing=0 cellpadding=0>
<tr><td width=5 height=13><img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>
</table>
</table>

<table cellspacing=0 cellpadding=0>
<table cellspacing=0 cellpadding=0>
<table cellspacing=0 cellpadding=0>
<tr><td width=5 absheight=106><img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<td width=15>
<td abswidth=139 valign=top>

$HTMLcont
</table>
</table>
</BODY>
</HTML>
ERIC
    ;

print $clients "200 OK\n";
print $clients "Content-length: ".length($HTMLcontX)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $HTMLcontX;

}else{
print $clients "500 No favorite of that name?  Fooling with URLs?\n\n";

}

