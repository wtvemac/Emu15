$donetransfer=1;
$closewhendone=1;
$foocount=0;
$declareinNG=0;
$nntp="";
$gorupname="";
$ngcount=0;
$ngarticle=0;
$doneNGList=0;
splice(@NGList);
$default="news.matnet.com";


$afug="";

chop($qurey);
@valueArray=split(/\&/,$qurey);
$ReloginProne=0;
foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);
$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

if($namem eq "gorupname"){
$gorupname=$valuem;
}
if($namem eq "nntp"){
$nntp=$valuem;
}

}

print $clients "200 OK\r\n";
print $clients "Connection: close\r\n";
print $clients "Content-type: text/html\r\n";
print $clients "Proxy: no-cache\r\n\r\n";

print $clients <<"ERIC"
<HTML>
<HEAD>
<DISPLAY fontsize=medium>
<TITLE>Featured discussion groups</TITLE>
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
<table href="wtv-news:news?category=1"
cellspacing=0 cellpadding=0>
<tr>
<td abswidth=5>
<td abswidth=90 valign=middle align=left>
<table bgcolor=3d2f3a cellspacing=0 cellpadding=0>
<tr>
<td absheight=1>
<tr>
<td maxlines=1>
<shadow><font sizerange=medium color="E7CE4A">All groups</font></shadow></table>
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
<td colspan=3 height=237 valign=bottom align=right >
<img src="wtv-forum:/images/BannerDiscuss.gif" width=50 height=165>	<tr><td colspan=3 absheight=36>
</table>
</sidebar>
<body
bgcolor="191919" text="42BD52" link="189CD6"
vlink="189CD6"
hspace=0
vspace=0>
<p>
ERIC
    ;
print $clients "<center><h1>News Group Updater</h1></center><br>";
print $clients "<br><br>";
print $clients "Group Name: <form><input name=gorupname bgcolor=#191919 text='42BD52'  nohighlight><br>";
print $clients "NNTP Server (Default: $default): <br><input name=nntp bgcolor=#191919 text='42BD52' nohighlight><br><input type='submit'><p>";
if($gorupname){
$nntp=$default if !($nntp);
print $clients "<br>Retriving news group data for <a href=news:$gorupname>$gorupname</a><br>Don't do anything till this is finished!  The server doesn't multitask.<br><hr><p>";
$sock=IO::Socket::INET->new("$nntp:119");

if($sock){
print $sock "GROUP $gorupname\r\n";

while(chop($buffer=<$sock>)) {
#Give me a chop one more time baby.
chop($buffer);
if(!($declareinNG)){
if($buffer=~/411 */){
print $clients "There is no such news group on this server ($nntp:119)<br>";
close($sock);
}elsif($buffer=~/211 */){
$declareinNG=1;
print $sock "LISTGROUP\r\n";
}
}else{
if(!($buffer=~/211 */)){

if(!($doneNGList)){
if($buffer ne "."){
print $clients "Adding $buffer to NG list<br>";
push(@NGList,$buffer);


}else{
print $clients "Done NG list\n";
$doneNGList=1;			  
print $clients "Now going to recive NG posts<p>";
print $sock "ARTICLE $NGList[$ngarticle]\r\n";
}
}else{
if(substr($buffer,0,3) == "423"){
print $clients "Dumb server gave me a bad article number <$NGList[$ngarticle]>.<br>";
$ngarticle++;
print $sock "ARTICLE $NGList[$ngarticle]\r\n";
if($foocount == $#NGList){
close($sock);
&Init;
}else{
$foocount++;
}


}else{
if(substr($buffer,0,3) == "220"){
$NGsubject="";
$NGfrom="";
$datestring="";
$MessageID="";
$ReplyID="";
print $clients "Trying to recive NG article $NGList[$ngarticle]<br>";

unlink("$gorupname/NewsGroups/$NGList[$ngarticle].txt");

open(FILE,"< $RealDir/NewsGroups/$gorupname/NGCount.txt");
chop($ngcount=<FILE>);
close(FILE);
if(!($ngcount)){
$ngcount=0;
}
$ngcount++;
open(FILE,"> $RealDir/NewsGroups/$gorupname/NGCount.txt");
print FILE "$ngcount\n";
close(FILE);

open(FILE,"< $RealDir/NewsGroups/NGList.txt");
@listf=<FILE>;
close(FILE);

$LALALA=0;
open(FILE,"> $RealDir/NewsGroups/NGList.txt");
foreach $FFF (@listf) {
chop($FFF);
if($FFF){
($AA,$BB)=split(/\:/,$FFF);
if($AA eq $gorupname){
print FILE "$gorupname:$ngcount:$nntp\n";
$LALALA=1;
}else{
print FILE "$AA:$BB\n";
}
}
}
if(!($LALALA)){
print FILE "$gorupname:$ngcount:$nntp\n";
}
close(FILE);

}else{
$donetransfer=0;


if(substr($buffer,0,9) eq "Subject: "){
$NGsubject=substr($buffer,9);
}elsif(substr($buffer,0,6) eq "From: "){
$NGfrom=substr($buffer,6);
$NGfrom=substr($NGfrom,0,index($NGfrom," "));
}elsif(substr($buffer,0,6) eq "Date: "){
$datestring=substr($buffer,6);
($x,$daystring,$monstring)=split(/ /,$datestring);
$datestring="$monstring $daystring";
}elsif(substr($buffer,0,12) eq "Message-ID: "){
$MessageID=substr($buffer,12);
}elsif(substr($buffer,0,12) eq "References: "){
$ReplyID=substr($buffer,12);
}

if($buffer ne "."){
$donetransfer=1;
open(FILE,">> $RealDir/NewsGroups/$gorupname/$NGList[$ngarticle].txt");
print FILE "$buffer\n";
close(FILE);
}else{
open(FILE,">> $RealDir/NewsGroups/$gorupname/NGData.txt");
print FILE "$MessageID\x00$ReplyID\x00$NGList[$ngarticle]\x00$NGsubject\x00$NGfrom\x00$datestring\n";
close(FILE);
$ngarticle++;
print $sock "ARTICLE $NGList[$ngarticle]\r\n";


if($foocount == $#NGList){
close($sock);
}else{
$foocount++;
}

}
}
}
}
}
}
}				 

}else{
print $clients "Can't connect to NNTP server, sorry<br>";
$default="news.ramlink.net";

}
}

