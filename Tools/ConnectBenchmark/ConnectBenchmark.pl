use IO::Socket;

print "Hello and welcome to the WNI Emulator benchmark tester.  This utility is used to test the preformance of the server at a given time.  Please first enter what type of test we want to punch on the server.\n\n";

Init();

sub Init {
print "1=PING,\n2=Operational Time,\n3=Get info.\n4=File Server Test\n5=Lentency\n6=Halt File Server Requests,\n7=Close all Clients,\n8=About,\nor 9=Quit\nEnter: ";
$functionnumber=<STDIN>;
chop($functionnumber);
getVariables();

open(FILE,">> BenchmarkReports.txt");
if($functionnumber eq "1"){
$PINGStuff="";
print FILE "-=PING Test=-\n\n";
print "-=PING Test=-\n\n";
print "Please enter the number of PINGs being sent: ";
$PINGCount=<STDIN>;
chop($PINGCount);
print "Please enter the packet mesure in bytes: ";
$packetmesure=<STDIN>;
chop($packetmesure);

for($i=0; $i < $packetmesure; $i++){
$PINGStuff.="F";
}

for($i=0; $i < $PINGCount; $i++){
$sock=IO::Socket::INET->new("$addrff:$listenport");
if(($sock)){
print "Pinging, $i\n";
print FILE "Pinging, $i\n";
print $sock "PING $PINGStuff\n\r\n\r";
}else{
print "Server doesn't exsist on the network!\n";
print FILE "Server doesn't exsist on the network!\n";
}
close($sock);
}
($seczx,$minsx,$hrsx)=localtime(time);
$sock=IO::Socket::INET->new("$addrff:$listenport");
print "Current Time: $hrsx:$minsx:$seczx\n";
print FILE "Current Time: $hrsx:$minsx:$seczx\n";
print $sock "RECVTIME $hrsx:$minsx:$seczx\r\n\r\n";

while($stuff=<$sock>){
if($stuff eq ".\n"){
close($sock);
}else{
print "$stuff";
print FILE "$stuff";
}
}
($seczxz,$minsxz,$hrsxz)=localtime(time);
$lagtime=calcSubTime($hrsxz,$minsxz,$seczxz,$hrsx,$minsx,$seczx);


print "Lag: $lagtime\n";
print FILE "Lag: $lagtime\n";

}elsif($functionnumber eq "2"){
print "-=Operational Time Test=-\n\n";
print FILE "-=Operational Time Test=-\n\n";

print "Please enter the number of times to check OT: ";
$LGCCount=<STDIN>;
chop($LGCCount);


for($i=0; $i < $LGCCount; $i++){
print "\n\n";
print FILE "\n\n";
print "Count ".($i+1)."\n";
print FILE "Count ".($i+1)."\n";
($seczx,$minsx,$hrsx)=localtime(time);
$sock=IO::Socket::INET->new("$addrff:$listenport");

if(($sock)){

print "Current Time: $hrsx:$minsx:$seczx\n";
print FILE "Current Time: $hrsx:$minsx:$seczx\n";
print $sock "RECVTIME $hrsx:$minsx:$seczx\r\n\r\n";

while($stuff=<$sock>){
if($stuff eq ".\n"){
close($sock);
}else{
print "$stuff";
print FILE "$stuff";
}
}
}else{
print "Server doesn't exsist on the network!\n";
print FILE "Server doesn't exsist on the network!\n";
}
}

}elsif($functionnumber eq "3"){
print "\n\n";
$sock=IO::Socket::INET->new("$addrff:$listenport");
if(($sock)){
print $sock "GETINFO\r\n\r\n";

while(chop($stuff=<$sock>)){
if($stuff eq "."){
close($sock);
print "Thats is it!\n";
print FILE "Thats is it!\n\n";
}else{
print "$stuff\n";
print FILE "$stuff\n";
}
}
}else{
print "Server doesn't exsist on the network!\n";
print FILE "Server doesn't exsist on the network!\n";
}
}elsif($functionnumber eq "4"){
if($mode eq 4){
$count=0;

print "\n\n";
fileServTest("wtv-benchmark:/test","First");
print "There where 11 tests did they all work?\n";
print FILE "There where 11 tests did they all work?\n";

}else{
print "Server is not in mode 4!\n";
}
}elsif($functionnumber eq "5"){


$sock=IO::Socket::INET->new("$addrff:$listenport");

if(($sock)){
print $sock "LATENCY\r\n\r\n";

while(chop($stuff=<$sock>)){

if($stuff){
close($sock);
$calcX=(int(time))-(int($stuff));
print "\nThe time is took for the server to send the data and it to come here is $calcX seconds.\n";
print "Probable connection media: ";
print FILE "\nThe time is took for the server to send the data and it to come here is $calcX seconds.\n";
print FILE "Probable connection media: ";
#blah, this doesn't work, lets give up
if($calcX < 1){
print "Ethernet/Intranet/T1/T3\n";
print FILE "Ethernet/Intranet/T1/T3\n";
}elsif($calcX < 3 && $calcX > 1){
print "Cable/DSL/Sattilite/Radio\n";
print FILE "Cable/DSL/Sattilite/Radio\n";
}elsif($calcX < 5 && $calcX > 3){
print "56k\n";
print FILE "56k\n";
}elsif($calcX < 7 && $calcX > 5){
print "23k\n";
print FILE "23k\n";
}elsif($calcX < 8 && $calcX > 7){
print "14k\n";
print FILE "14k\n";
}else{
print "DAMN!!! way to slow to tell...";
print FILE "DAMN!!! way to slow to tell...";
}
print "^ based on normal working conditions. ^";
}


}
}else{
print "Server doesn't exsist on the network!\n";
print FILE "Server doesn't exsist on the network!\n";
}



}elsif($functionnumber eq "6"){
$sock=IO::Socket::INET->new("$addrff:$listenport");
if(($sock)){
print $sock "HALT\r\n\r\n";

while($stuff=<$sock>){
if($stuff eq ".\n"){
close($sock);
}else{
print "$stuff";
print FILE "$stuff";
}
}
}else{
print "Server doesn't exsist on the network!\n";
print FILE "Server doesn't exsist on the network!\n";
}
}elsif($functionnumber eq "7"){
$sock=IO::Socket::INET->new("$addrff:$listenport");
if(($sock)){
print $sock "CAC\r\n\r\n";
}else{
print "Server doesn't exsist on the network!\n";
print FILE "Server doesn't exsist on the network!\n";
}
}elsif($functionnumber eq "8"){
print "The WNI server emulator can run into many problems in time.  Depending on how fast your computer is vs the connection speed at the given point in time the server could run great or run like crap.  The more clients the server has to handle the slower it will operate since it will have to scan all the clients one by one and this takes up time.  If you have so many programs is the same, the OS has to go down the line as well.  Depending on your OS/Modem/Connection Rate/Transport Size this could be a larger problem than others.  The problem with this server is that it needs tons of execution time and as I noticed image data could be given a time after it should.  I tired to stop this but I couln't find a solid way to do this and not hamper the Emulation of WNI servers.  I must insist on mode 4 to have one client at a time this is how I set up the server.  Multible clients have been disabled.\n";
}elsif($functionnumber eq "9"){
exit;
}


sub getVariables {
print "\n\n";
$mode="";
$listenport="";


open(FILE,"< ../../Config.ini");
@config=<FILE>;
close(FILE);

foreach $line (@config) {
chop($line);
@foo=split(/=/,$line);


if($foo[0] eq "clientsconnectsionmax"){
$clientsconnectsionmax=$foo[1];
print "The servr client quota is $clientsconnectsionmax\n";
}

if($foo[0] eq "mode"){
$mode=$foo[1];
print "The server mode: $mode\n";
}

if($foo[0] eq "listenport"){
$listenport=$foo[1];
($addrff)=gethostbyname('');
print "The server address is $addrff:$listenport\n";
}

}
if(!($listenport)){
print "Please type in the IP address and port of the target server (IP:PORT): ";
chop($bigfat=<STDIN>);
($addrff,$listenport)=split(/\:/,$bigfat);
}
if(!($mode)){
$mode=4;
}

}

print "\n\n";
print FILE "\n\n";
close(FILE);
Init();
}

sub fileServTest {

$send=$_[0];
$lazynumber=$_[1];
$handcount=$_[2];
$NopeWhat="";
$sock=IO::Socket::INET->new("$addrff:$listenport");

if(($sock)){
$count++;

print $sock "GET $send\r\n\r\n";
while(chop($stuff=<$sock>)){
if(!($handcount)){
if($stuff eq "$send "){
print FILE "$_[1] Test Succedded!\n";
print "$_[1] Test Succedded!\n";
close($sock);
}
}else{
if($stuff eq $handcount){
print "$_[1] Test Succedded!\n";
print FILE "$_[1] Test Succedded!\n";
close($sock);
}

}


if($count eq 1){
fileServTest("wtv-benchmark:/hello2","Second");
}elsif($count eq 2){
fileServTest("wtv-benchmark:/hello3","Third");
}elsif($count eq 3){
fileServTest("wtv-benchmark:/diringberg/hello4","Fourth");
}elsif($count eq 4){
fileServTest("wtv-benchmark:/hello5","Fith");
}elsif($count eq 5){
fileServTest("wtv-benchmark:/hello6","Sixth");
}elsif($count eq 6){
fileServTest("wtv-benchmark:/hello7","Seventh");
}elsif($count eq 7){
fileServTest("wtv-benchmark:/diringberg/hello8","Eighth");
}elsif($count eq 8){
open(FILEz,"< ../../ServiceVault/wtv-benchmark/diringberg/diringberg.gif");
@interesting=<FILEz>;
close(FILEz);
foreach $IsawYou (@interesting) {
$NopeWhat.=$IsawYou;
}
fileServTest("wtv-benchmark:/diringberg/diringberg.gif","Ninth",$NopeWhat);
}elsif($count eq 9){
open(FILEz,"< ../../ServiceVault/wtv-benchmark/diringberg/diringberg2.gif");
@interesting=<FILEz>;
close(FILEz);
foreach $IsawYou (@interesting) {
$NopeWhat.=$IsawYou;
}
fileServTest("wtv-benchmark:/diringberg/diringberg2.gif","Tenth",$NopeWhat);
}elsif($count eq 10){
open(FILEz,"< ../../ServiceVault/wtv-benchmark/diringberg/diringberg3.gif");
@interesting=<FILEz>;
close(FILEz);
foreach $IsawYou (@interesting) {
$NopeWhat.=$IsawYou;
}
fileServTest("wtv-benchmark:/diringberg/diringberg3.gif","Eleventh",$NopeWhat);
}
}
}else{
print "Server doesn't exsist on the network!\n";
print FILE "Server doesn't exsist on the network!\n";

}


}

sub calcSubTime {
($aa,$bb,$cc,$dd,$ee,$ff)=@_;
if($ff > $cc){
$bb--;
$cc=$cc+60;
$secvalue=$cc-$ff;
}else{
$secvalue=$cc-$ff;
}

if($ee > $bb){
$aa--;
$bb=$bb+60;
$minvalue=$bb-$ee;
}else{
$minvalue=$bb-$ee;
}

$hrvalue=$aa-$dd;

return "$hrvalue hours $minvalue minutes $secvalue seconds";

}

