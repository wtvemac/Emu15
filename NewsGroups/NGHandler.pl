use IO::Socket;

print "-=News Group Updater=-\n";
$default="news.matnet.com";
&Init;
sub Init {
$donetransfer=1;
$foocount=0;
$declareinNG=0;
$ngcount=0;
$ngarticle=0;
$doneNGList=0;
splice(@NGList);
print "\n\n";
print "Group Name: ";
chop($gorupname=<STDIN>);
print "NNTP Server (Default: $default): ";
chop($nntp=<STDIN>);
if(!(opendir(DIR,"$gorupname"))){
mkdir("$gorupname",1);
}else{
unlink("$gorupname/NGData.txt");
}
print "Now populating NG group.\n";
&EstablishConnection;
}

sub EstablishConnection {
$nntp=$default if !($nntp);

$sock=IO::Socket::INET->new("$nntp:119");

if($sock){
print $sock "GROUP $gorupname\r\n";

while(chop($buffer=<$sock>)) {
#Give me a chop one more time baby.
chop($buffer);
if(!($declareinNG)){
if($buffer=~/411 */){
print STDERR "There is no such news group on this server ($nntp:119)\n";
close($sock)
&Init;
}elsif($buffer=~/211 */){
$declareinNG=1;
print $sock "LISTGROUP\r\n";
}
}else{
if(!($buffer=~/211 */)){

if(!($doneNGList)){
if($buffer ne "."){
print "Adding $buffer to NG list\n";
push(@NGList,$buffer);


}else{
print "Done NG list\n";
$doneNGList=1;			  
print "Now going to recive NG posts\n";
print $sock "ARTICLE $NGList[$ngarticle]\r\n";
}
}else{
if(substr($buffer,0,3) == "423"){
print "Dumb server gave me a bad article number <$NGList[$ngarticle]>.\n";
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
print "Trying to recive NG article $NGList[$ngarticle]\n";

unlink("$gorupname/$NGList[$ngarticle].txt");

open(FILE,"< $gorupname/NGCount.txt");
chop($ngcount=<FILE>);
close(FILE);
if(!($ngcount)){
$ngcount=0;
}
$ngcount++;
open(FILE,"> $gorupname/NGCount.txt");
print FILE "$ngcount\n";
close(FILE);

open(FILE,"< NGList.txt");
@listf=<FILE>;
close(FILE);

$LALALA=0;
open(FILE,"> NGList.txt");
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
open(FILE,">> $gorupname/$NGList[$ngarticle].txt");
print FILE "$buffer\n";
close(FILE);
}else{
open(FILE,">> $gorupname/NGData.txt");
print FILE "$MessageID\x00$ReplyID\x00$NGList[$ngarticle]\x00$NGsubject\x00$NGfrom\x00$datestring\n";
close(FILE);
$ngarticle++;
print $sock "ARTICLE $NGList[$ngarticle]\r\n";


if($foocount == $#NGList){
close($sock);
&Init;
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
print "Can't connect to NNTP server, sorry\n";
$default="news.ramlink.net";

&Init;
}
}


