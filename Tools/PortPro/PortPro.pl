#!/usr/bin/perl



#Link Socket module
use IO::Socket;

#Define the body content type
print "-=Eric MacDonald's Port Scan=-\n\n";


%PortDesc=("7" => "Echo"
,"13" => "DayTime"
,"17" => "QOTD"
,"19" => "Chargen"
,"21" => "FTP"
,"22" => "SSH"
,"23" => "Telnet"
,"25" => "SMTP"
,"43" => "WHOIS"
,"53" => "DNS"
,"70" => "GOPHER"
,"79" => "FINGER"
,"80" => "HTTP"
,"109" => "POP2"
,"110" => "POP3"
,"113" => "AUTH"
,"119" => "NNTP"
,"135" => "LOC-SRV"
,"139" => "NETBIOS-SSN"
,"143" => "IMAP2"
,"443" => "HTTPS"
,"445" => "Microsoft-DS"
,"507" => "UNKNOWN (507)"
,"513" => "LOGIN (513)"
,"522" => "UNKNOWN (522)"
,"563" => "SNEWS (563)"
,"6667" => "IRC1 (6667)"
,"6668" => "IRC2 (6668)"
,"6666" => "IRC3 (6666)"
,"6665" => "IRC4 (6665)"
,"7000" => "IRC5 (7000)"
,"7001" => "IRC6 (7001)"
,"1601" => "'Head Waiter' (wtv-head-waiter)"
,"1602" => "Tricks (wtv-tricks)"
,"1603" => "WebTV Univalable (wtv-star, wtv-*)"
,"1604" => "UNKOWN"
,"1605" => "Usenet, News (news, wtv-news, wtv-forum)"
,"1607" => "Registration Server (wtv-register)"
,"1608" => "Mail Allocation/TOC (wtv-mail, mailto)"
,"1609" => "WebTV Loging (wtv-log)"
,"1611" => "Favorites Server (wtv-favorite)"
,"1612" => "WebTV Home (wtv-home)"
,"1613" => "User Setup (wtv-setup)"
,"1614" => "DB Log (wtv-dblog)"
,"1615" => "Scriptless Server (wtv-1800)"
,"1617" => "UNKOWN"
,"1618" => "Flash ROM Downloads (wtv-flashrom)"
,"1619" => "Cookies (wtv-cookie)"
,"1621" => "WebTV help (wtv-guide, wtv-intro)"
,"1622" => "WebTV Notices (wtv-notices)"
,"1623" => "Custom TellyScript (wtv-customscript)"
,"1625" => "Explore (wtv-explore, wtv-explore2)"
,"1628" => "AroundTown (wtv-aroundtown)"
,"1629" => "Content (wtv-content)"
,"1630" => "Chat (wtv-chat, wtvchat)"
,"1632" => "Smartcard (wtv-smartcard)"
,"1633" => "TV Listings Server (wtv-epguide)"
,"1634" => "Video Download (wtv-video)"
,"1635" => "DataDownload (wtv-disk)"
,"1636" => "tutorial (wtv-tutorial)"
,"1638" => "Partner (wtv-partner)"
,"1639" => "WebTV Centers (wtv-center)"
,"1640" => "Page Builder Pages (http://)"
,"1641" => "Page Builder Pages2 (http://)"
,"1642" => "Spot Ads (wtv-spot)"
,"1643" => "Page Builder (wtv-author)"
,"1648" => "TV Onair Programs (wtv-onair)"
,"1650" => "Proxy (http, ftp, https, gopher, file)"
,"1651" => "UNKNOWN WIERD SERVICE"
,"1652" => "UNKNOWN WIERD SERVICE"
,"1654" => "MSN/Messenger Passport (wtv-passport)"
,"1655" => "UNKNOWN WIERD SERVICE"
,"1656" => "Music (wtv-music)"
,"1657" => "Census UDP (wtv-census-udp)"
,"8080" => "HTTP2 (8080)");


init();


sub execute {
$portsub1++;


if(!($portsub1) or !($portsub2)){
print "\nMissing some variables!\n";
init();

}else{
#Are we ready to rumble?
if($heyscxz){
open(FILE,"IP.txt");
@CCCX=<FILE>;
close(FILE);
foreach  (@CCCX) {
chop;
($IP,$PORTX)=split(/\:/,$_);

if($IP){
if($PORTX){

ScanIPRange($IP,$IP,($PORTX)+1,$PORTX);
}else{

ScanIPRange($IP,$IP,$portsub1,$portsub2);
}
}
}

}else{


@arrayMe=split(/\,/,$ipsub1);
foreach $segment (@arrayMe){
$from=$segment;
$to=$segment;
$from=~s/\*/1/;
$to=~s/\*/254/;
if($segment=~/-/){
($from,$to)=split(/-/,$segment);
}else{
$from=$from;
if(($ipsub2) && ($ipsub1)){
$to=$ipsub2;
}else{
$to=$to;
}
}

$toxz=$portsub1;
$toxz--;
open(FILE,">> ScanedPorts.txt");
print "\n$from - $to (From: $portsub2 To: $toxz)\n\n";
print FILE "\n$from - $to (From: $portsub2 To: $toxz)\n\n";
close(FILE);
ScanIPRange($from,$to,$portsub1,$portsub2);
}
}

}
}


sub ScanIPRange {
$curIP=$_[0];
$toIP=$_[1];
$fromPort=$_[2];
$toPort=$_[3];
for(;;){
for($vvv=$toPort; $vvv < $fromPort; $vvv++){
print "Trying $curIP:$vvv\n";
if(IO::Socket::INET->new("$curIP:$vvv")){
print "$curIP:$vvv ".$PortDesc{$vvv}."\n";


do 'Target.txt';





}

}
if($curIP eq $toIP){
last;
}
$curIP=AddIP($curIP);
}
}

sub AddIP {
($a,$b,$c,$d)=split(/\./,$_[0]);
if($d eq 255){
$d=0;
if($c eq 255){
$c=0;
if($b eq 255){
$b=0;
if($a eq 255){
$a=0;
}else{
$a++;
}
}else{
$b++;
}
}else{
$c++;
}
}else{
$d++;
}
return "$a.$b.$c.$d";
}


sub init {
$heyscxz=0;
if(open(FILE,"IP.txt")){
print "Use IP file? (y/n): ";

chop($CCC=<STDIN>);

if($CCC eq "y"){
$heyscxz=1;
}else{
$heyscxz=0;
}
}


if(!($heyscxz)){
print "Starting IP: ";
$ipsub1=<STDIN>;
chop($ipsub1);
print "Ending IP: ";
$ipsub2=<STDIN>;
chop($ipsub2);
}
print "Starting Port: ";
$portsub2=<STDIN>;
chop($portsub1);
print "Ending Port: ";
$portsub1=<STDIN>;
chop($portsub2);

execute();
}
print "\n\nPress enter to exit this program.";
<STDIN>;