$countxz=0;
splice(@valueArray);
$pastcontenttype=0;
$MiddleHTML="";
$Counting=0;
foreach $thethings (@headersforye) {
$countxz++;
if(lc(substr($thethings,0,index($thethings," "))) eq "content-length:"){
$pastcontenttype=1;

}

if($countxz eq ($#headersforye)+1 && $pastcontenttype){
@valueArray=split(/\&/,$thethings);
}
}
if(!($valueArray[0])){
chop($qurey);
@valueArray=split(/\&/,$qurey);
}

foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);
$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

if($namem eq "search"){
$NGSearch=$valuem;
}
}


if(!($NGSearch)){
print $clients "500 Please enter a string to search.\n\n";
}else{
if(open(FILE,"$RealDir/NewsGroups/NGList.txt")){
@stuffinside=<FILE>;
close(FILE);

foreach $nglisting (@stuffinside){
chop($nglisting);
($ngname,$ngartpop)=split(/\:/,$nglisting);


if($ngname=~/$NGSearch/g){
$Counting++;
$MiddleHTML.=<<"ERIC"
<IMG src="wtv-home:/ROMCache/Spacer.gif" width=10 height=13><img src="wtv-forum:/images/Rule.gif" width=436 height=13><br>
<IMG src="wtv-home:/ROMCache/Spacer.gif" width=1 height=6><br>
<tr>
<td width=10>
<td width=426>
<table href="wtv-news:/news?group=$ngname" cellspacing=0 cellpadding=0>
<tr>
<td abswidth=401 height=19 valign=top>
<shadow><b>$ngname
</table>

ERIC
    ;
}
}
}


if($MiddleHTML){
$MiddleHTML.=<<"ERIC"
<IMG src="wtv-home:/ROMCache/Spacer.gif" width=10 height=13><img src="wtv-forum:/images/Rule.gif" width=436 height=13><br>
<IMG src="wtv-home:/ROMCache/Spacer.gif" width=1 height=6><br>
<tr>
<td width=10>
<td width=426>
ERIC
    ;
$TOPMessage="<shadow>
Discussion groups found
</shadow>
</blackface>
</font>
</table>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=10 height=1 valign=top align=left>
<img src=\"wtv-home:/ROMCache/Spacer.gif\" width=10 height=1>
<td height=33 width=256 valign=bottom>
$Counting group(s) match <b>$NGSearch</b>.";


$CACA=<<"ERIC"
<img src="wtv-home:/ROMCache/Spacer.gif" width=10 height=6>
<td width=180 valign=bottom align=right>
</table>	<TABLE width=446 cellspacing=0 cellpadding=0>
<tr>
<td rowspan=3 width=10 height=1>
<img src="wtv-home:/ROMCache/Spacer.gif" width=10 height=1>
<td height=2 width=436 bgcolor="2B2B2B">
<img src="wtv-home:/ROMCache/Spacer.gif" width=436 height=1>
<tr>
<td height=1>
<tr>
<td height=2 bgcolor="0D0D0D">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</TABLE>
<IMG src="wtv-home:/ROMCache/Spacer.gif" width=1 height=6><br>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=10>
<td width=426>


$MiddleHTML



<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=13><br>
<table cellspacing=0 cellpadding=0>
<tr>
<td rowspan=4 width=10 height=1>
<img src="wtv-home:/ROMCache/Spacer.gif" width=10 height=1>
<td height=2 width=436 bgcolor="2B2B2B">
<img src="wtv-home:/ROMCache/Spacer.gif" width=436 height=1>
<tr>
<td height=1>
<tr>
<td height=2 bgcolor="0D0D0D">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td height=6>
</TABLE>

ERIC
    ;
}else{
$TOPMessage="No News groups found";
$CACA="";
}



$stuffsentout=<<"ERIC"
<HTML>
<HEAD>
<DISPLAY fontsize=medium>
<TITLE>Discussion groups found</TITLE>
</HEAD>
<sidebar width=114 height=420 align=left>
<table cellspacing=0 cellpadding=0 bgcolor=3d2f3a>
<tr>
<td colspan=3 width=104 absheight=4>
<td rowspan=100 width=10 height=420 valign=top align=left bgcolor=191919>
<img src="wtv-mail:/ROMCache/Shadow.gif" width=6 height=420>
<tr>
<td abswidth=6>
<td abswidth=93 absheight=76>
<table href="wtv-home:/home" absheight=76 cellspacing=0 cellpadding=0>
<tr>
<td align=right>
<img src="wtv-home:/ROMCache/WebTVLogoJewel.gif" width=87 height=67>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=231d22>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left <img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=5b4b58>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td abswidth=6 >
<td abswidth=93 absheight=26 >
<table href="wtv-guide:/help?topic=Discuss&subtopic=Index&appName=Discuss"
cellspacing=0 cellpadding=0>
<tr>
<td abswidth=5>
<td abswidth=90 valign=middle align=left>
<table bgcolor=3d2f3a cellspacing=0 cellpadding=0>
<tr>
<td absheight=1>
<tr>
<td maxlines=1>
<shadow><font sizerange=medium color="E7CE4A">Help</font></shadow></table>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=231d22>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left <img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=5b4b58>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 height=268 valign=bottom align=right >
<img src="wtv-forum:/images/BannerDiscuss.gif" width=50 height=165>	<tr><td colspan=3 absheight=36>
</table>
</sidebar>
<body
bgcolor="191919" text="42BD52" link="189CD6"
vlink="189CD6"
vspace=0
hspace=0>
<table cellspacing=0 cellpadding=0>
<tr>
<td rowspan=100 width=10 height=384 valign=top align=left>
<td height=16 width=416 valign=top align=left>
<td rowspan=100 width=20 height=384 valign=top align=left>
<tr>
<td height=31 valign=top>
<font size="+1" color="E7CE4A">
<blackface>
$TOPMessage
<br>

$CACA
<IMG src="wtv-home:/ROMCache/Spacer.gif" width=10 height=13>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=10>
<td absheight=100 abswidth=416 valign=top align=left>
Do you want to look for something else?<br>
<img src="/ROMCache/Spacer.gif" width=1 height=4>
<form action="wtv-news:/search">
<input name="search" bgcolor=#202020 cursor=#cc9933 text="E7CE4A" font=proportional value="" SIZE=28 MAXLENGTH=100>
&nbsp;
<font color=E7CE4A><shadow>
<input type=submit borderimage="file://ROM/Borders/ButtonBorder2.bif" value="Look for" usestyle>
</shadow></font>
</form>
</table>
</BODY>
</HTML>
ERIC
    ;

print $clients "200 OK\n";
print $clients "Content-length: ".length($stuffsentout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $stuffsentout;
}