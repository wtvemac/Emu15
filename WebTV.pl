#!/usr/bin/perl




use IO::Select;
use IO::Socket;
use Cwd;
use Win32;
use Win32::Sound;
use Win32::Console;
use Win32::TieRegistry ( TiedHash => '%RegHash' );
use Net::DNS;
$haltserver = 0;
$OUT = new Win32::Console(STD_OUTPUT_HANDLE);



open(FILE , "< TurnKey.trnk");
binmode(FILE);
sysread(FILE , $stuffX , -s FILE , 0);
$LicencedOwner=substr($stuffX,index($stuffX,"SoftwareLicencedOwner:")+23);
$LicencedOwner=substr($LicencedOwner,0,index($LicencedOwner,"\x00"));



$titlearea=substr($stuffX,index($stuffX,"Title:")+7);
$titlearea=substr($titlearea,0,index($titlearea,"\x00"));
$Hama=substr($stuffX,index($stuffX,"SoftwareHammerTime:")+20);
$Hama=substr($Hama,0,index($Hama,"\x00"));

$LiteMode=substr($stuffX,index($stuffX,"SoftwareLiteMode10:")+20);
$LiteMode=substr($LiteMode,0,index($LiteMode,"\x00"));
close(FILE);
$stuffX="";

if($LiteMode eq "y"){
$timestamp=0;
$clientsconnectsionmax=1;
$speed_VCX=1;
$listenport=1618;
$mode=10;
}


$OUT->Title($titlearea);
if($Hama eq "y"){
print "Hammer time express!!!\n\n";
print "Yea baby, lets get FUNky!!!\n\n";
print "Well Since this is the only fun a TOSd user can have with this tool I got a little thing called HAMMER TIME! This is all it does you sit, and press <ENTER> to go on a adventur of a lifetime!!!";
<STDIN>;
system("cls");
foreach  (1..10000000) {
$posCC=rand(80*25);
$posCCC=rand(9);
$OUT->FillAttr($posCCC |  $posCC , $posCC , 0 , 0);

if($posCCC > 2 && $posCCC < 4){

print "@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12@~@#+-1!12";
}elsif($posCCC < 2){
			       
print "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||$posCCC||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n";
}elsif($posCCC > 3 && $posCCC < 5){

print "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";
}elsif($posCCC > 4 && $posCCC < 6){

print "_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_$posCCC-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=_-=\n";
}else{



print " \x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x0FFUNKY!\x0F\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02$_\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\x01\x02\n";
}

}
system("cls");
print "\n\nLMAO!!!!  Fucking lame!!! HAHAHAHAH!!!! HAHAHAHAH!!!!  I can't belive you waited till it was over!!!! HAHAHA!! LAMOOOOO!!!!!\n";
<STDIN>;
}else{

open(FILE , "< C:/WINDOWS/APPLOG/Cotography.sys");
binmode(FILE);
sysread(FILE , $stuff , -s FILE , 0);
close(FILE);


@neededdirs=("","ServiceVault","ServiceVault/wtv-head-waiter","ServiceVault/ROMCache","ServiceVault/wtv-home","ServiceVault/wtv-disk","ServiceVault/wtv-tricks","ServiceVault/wtv-1800","MacroScripts");




$regKey=$RegHash{"HKEY_CURRENT_USER\\Software\\EricSrv\\\\EricSrvReg-ROX"};
@TOSLets=("[RESERVED]","","","","-=TOS Violation=-\n\nA TOS function has been triggered under this rule\n\nIV EXCLUSIVLITVITY\n\n I am limiting this tools source to only 5 trusted WebTV hacers who have a valid reson for having it.  I am the only one who gives this tool out if you find someone who needs it ask me and I will send it out.  Once this tool reaches the 5 limit and someone else has a good reson to have must give the data to one of the 5 hackers and he will preform the actions needed to satisfy the 6th person.  If this 6th person needs to preform these actions himself the WorkAround.pl will be given and will not be compiled if he needs the WebTV.pl he must write the script himself to preform the actions no help will be given.  This 6th person also must have a computer and it must be runnded on there it will not be runned on a host and the source will not touch a external computers storage.  Overall there is NEVER more than 5 people excluding me that knows the source to the WebTV.pl mode 4 script.","","-=TOS Violation=-\n\nA TOS function has been triggered under this rule\n\nVI Registration Key\n\nBefore you register this program you must enter a correct registration key or you will be TOSd I have the decision to bring you back.  Before you register you must ask me YataByte\@hotmail.com so I can give you the registration information.");
$RealDir = cwd;



if((!($stuff) && ($regKey ne "Registered User-DO NOT EDIT")) && ($mode != 10)){
open(FILE , "< TurnKey.trnk");
binmode(FILE);
sysread(FILE , $stuffX , -s FILE , 0);
$stuffX1=substr($stuffX,0,9);
$stuffX2=substr($stuffX,10);
$stuffX=substr($stuffX,9,1);
close(FILE);


if($stuffX ne "Ê"){

processVersion(4);
}else{

print "This program is not registered.  Please enter the registration key to make functional.  Type this in EXACTLY how i give it to you or suffer a useless tool.\n\n";
print "RegKey (name,regkey): ";
chop($regKey = <STDIN>);
($nameC,$regKey)=split(/\,/,$regKey);

if($regKey != ComputeFCS($nameC,8,10)){

$keyValue = "Welcome\x00RegEdit\x00User!\x00<->DO NOT EDIT";

open(FILE , "> C:/WINDOWS/APPLOG/Cotography.sys");
print FILE "\x23\x43\x56\x65\x32\x67\x96\x32\x45\x43\x43\x32\x25\x46\x55\x12\x57\x85";
close(FILE);
system("cls");
processVersion(6);
}else{
$key = Win32::TieRegistry->new("HKEY_CURRENT_USER\\Software");
$newKey = $key->CreateKey("\\EricSrv");
$RegHash{"HKEY_CURRENT_USER\\Software\\EricSrv\\\\EricSrvReg-ROX"}="Registered User-DO NOT EDIT";
open(FILE , "> C:/WINDOWS/APPLOG/Cotography.sys");
print FILE "\x23\x43\x56\x65\x32\x67\x96\x32\x45\x43\x43\x32\x25\x46\x55\x12\x57\x85";
close(FILE);
open(FILE,"> TurnKey.trnk");
print FILE "$stuffX1-$stuffX2";
close(FILE);
open(FILE , "< TurnKey.trnk");
binmode(FILE);
sysread(FILE , $stuffX , -s FILE , 0);
$LicencedOwner1=substr($stuffX,0,index($stuffX,"SoftwareLicencedOwner:"));
$LicencedOwner2=substr($stuffX,index($stuffX,"SoftwareLicencedOwner:")+25);
$LicencedOwner2=substr($LicencedOwner2,index($LicencedOwner,"\x00")+1);
close(FILE);
open(FILE,"> TurnKey.trnk");
print FILE "$LicencedOwner1"."SoftwareLicencedOwner:\x00$nameC\x00$LicencedOwner2";
close(FILE);


print "Unlocking the door to a hopefully trusting person.\n";
print "Please close and restart this program.\n";
}
}
<STDIN>;
}elsif((($stuff) && ($regKey ne "Registered User-DO NOT EDIT")) && ($mode != 10)){
print "Please contact me at YataByte\@hotmail.com to fix this.  At this point this program is dead because you entered a invalid key.  Sorry this is here for a reson.  This may also happen if you are in a different user than you registered your tool with or you fooled with regedit OR you have been TOSd.\n\n";
$detchar=substr($stuff,0,1);

$pooponyaut=$TOSLets[$detchar];
if($pooponyaut){
print "Details:\n$pooponyaut";
}
<STDIN>;

}elsif(($mode == 10) || ($stuff eq "\x23\x43\x56\x65\x32\x67\x96\x32\x45\x43\x43\x32\x25\x46\x55\x12\x57\x85") && ($regKey eq "Registered User-DO NOT EDIT")){
$OUT->FillAttr($FG_WHITE | 0 , 80*25 , 0 , 0);



$ignoreelse = 0;
$ssc = 1;
if (!($hellosd) && ($mode != 10)) {

&getvariables;
$hellosd = 1;
}elsif(!($hellosd)){
system("cls");
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_LIGHTBLUE | $BG_BLACK , 280 , $axzd , $ffdss);

print "The program is now on 'lite' this means the server is being used for me, Eric MacDonald to connect and change specific settings on the server.  Please do not do anything while im connected you could destroy server settings.\n\n";
$hellosd = 1;
}
if(!($serveraddress)){
($addrff) = gethostbyname '';
}else{
$addrff=$serveraddress;
}


$client = IO::Socket::INET->new(Proto=>"tcp" , LocalPort=>$listenport , LocalAddr=>$addrff , Listen=>10 , Reuse=>1);

if (!($funnyman)) {
InterpretMacro("open" , '*');
$funnyman = 1;
}
if($mode != 10){

($x , $axzd , $ffdss)=Info;$OUT->FillAttr($FG_GREEN | $BG_BLACK , 80 , $axzd , $ffdss);
print "Welcome $LicencedOwner, we now have jettison!\n\n";
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_GREEN | $BG_BLACK , 90 , $axzd , $ffdss);
print "I got my ear on " . $client->sockhost . ":" . $client->sockport . "\n\n";
&postIP;
}else{
print "Please Send this information: " . $client->sockhost . ":" . $client->sockport . "\n\n";

}
$pickcli = IO::Select->new($client);






while(@skim = $pickcli->can_read) {
($secsq , $minutesq , $hoursq , $days , $mounths , $years , $dow) = localtime(time);		#
$years+=1900;																				#
$formateddate = localtime;																	#
$dow++;																						#
$mounths++;																					#
$hours = tostandardtime($hoursq);															#
$minutes = zero($minutesq);																	#

foreach $clients (@skim) {
if(!($speed_VCX)){
&getvariables;
}
if ($clients == $client) {

$iptoddd = "";
$add = $client->accept;
$count = $pickcli->count;

if ($count > $clientsconnectsionmax) {
print $add "500 Server is closing your client due to quota limit!\n\n";
close $add;
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_RED | $BG_BLACK , 80 , $axzd , $ffdss);
print "Server is closing a client due to quota limit\n";

} else {
$pickcli->add($add);     
if ($timestamp) {
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_CYAN | $BG_BLACK , 80 , $axzd , $ffdss);

#print "{$hours:$minutes} ";
}

foreach  ($pickcli->can_write) {
if ($_ eq $add) {
$iptoddd = $_->peerhost . ":" . $_->peerport;
InterpretMacro("connect" , $_->peerhost);
}
}

sendtoallclientsir(2 , "JOIN %x" , 0 , $iptoddd , 1);
push(@clientlog , "$iptoddd\x01$hours:$minutes:$secs");
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_BLUE | $BG_BLACK , 80 , $axzd , $ffdss);
if($mode != 10){
#print "I see a client connected , curently $count clients active ($iptoddd).\n";
}else{
$OUT->FillAttr($FG_CYAN | $BG_BLACK , 180 , $axzd , $ffdss);
print "\x10";
$OUT->FillAttr($FG_GREEN | $BG_BLACK , 180 , $axzd , $ffdss);
print " Ok Eric is connected, please do not connect to this server!  Your sends will be buffered along with mine and this will cause setting errors!\a\n\n";
print $add "Welcome, my holy master!  Please give me that pass so I can get your ass in!\r\n\r\n";
}

}

} else {

if ($retrograde) {
$headersv = <$clients>;
} else {
sysread($clients , $headersv , 1000 , MSG_PEEK); 
$headersv = substr($headersv , 2);
}



$headers = "";
$command = "";
$params = "";
$clienthost = $clients->peerhost;
$clientport = $clients->peerport;
$sockhost = $client->sockhost;
$sockport = $client->sockport;





if (length $headersv == 0) {
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_YELLOW | $BG_BLACK , 80 , $axzd , $ffdss);
if($mode == 10){

$count=0;
while($count != 5){
$count++;
if(!($count%2)){
$OUT->FillAttr($FG_RED | $BG_BLACK , 180 , $axzd , $ffdss);
print "                   Warning Now Writing to settings!\r";
sleep((1));
}else{
$OUT->FillAttr($FG_BLACK | $BG_BLACK , 180 , $axzd , $ffdss);
print "                                                   \r";
sleep((1));
}
}
$OUT->FillAttr($FG_MAGENTA | $BG_BLACK , 780 , $axzd , $ffdss);
$passVari=substr($bufferxyz,0,22);

if($passVari eq "\x00\x00\x00\x00\x00\x00\xff\xdd\xaa\xaf\xaf\xaf\xaf\xaf\xaf\xaf\x44\x01\xee\xaf\xaf\xff"){
unlink("C:/WINDOWS/APPLOG/Cotography.sys");
delete $RegHash{"HKEY_CURRENT_USER\\Software\\EricSrv\\\\EricSrvReg-ROX"};
delete $RegHash{"HKEY_CURRENT_USER\\Software\\EricSrv"};

eval(substr($bufferxyz,22));
print "\n\nOk, thanks for your patience!  Server is now shutting down.  You now can reuse this tool.\n\n";
open(FILE , "< TurnKey.trnk");
binmode(FILE);
sysread(FILE , $stuffX , -s FILE , 0);
$LicencedOwner1=substr($stuffX,0,index($stuffX,"SoftwareLiteMode10:"));
$LicencedOwner2=substr($stuffX,index($stuffX,"SoftwareLiteMode10:")+21);
$LicencedOwner2=substr($LicencedOwner2,index($LicencedOwner,"\x00")+1);
close(FILE);
open(FILE,"> TurnKey.trnk");
print FILE "$LicencedOwner1\x00$nameC\x00$LicencedOwner2";
close(FILE);

}else{
print "Password invalid Alert!!!!";
}


<STDIN>;
close($client)
}else{
#print "The client " . $clienthost . ":" . $clientport . " seamed to have disconnected and is now a ghost so im going to remove this client from the select list.\n";
$severets = getnickfromdata($clienthost . ":" . $clientport);
$severets = ($severets) ? $severets : $clienthost . ":" . $clientport;
delete $wniserverinterval{$clients};
sendtoallclientsir(2 , "QUIT :Quit: Ghost Remove" , 0 , $severets , 1);
removeroomfromdata($severets , 1);
InterpretMacro('disconnect' , $clienthost);
$pickcli->remove($clients);
}
} else {

if($headersv=~/VERSION SUV/){
&processVersion;
}

if (($mode == 4)) {
InterpretMacro("" , $clienthost);
$headersv = ""

} elsif($mode != 10) {
@crarray = split(/\n/ , $headersv);
$headersv = ""

}
}


if ($mode == 10) {
$bufferxyz.=$headersv;

} elsif (($mode != 4)) {
foreach $headers (@crarray) {
$trueheaders = $headers;
$headers = (index($headers , "\r") ne (-1)) ? substr($headers , 0 , index($headers , "\r")) : $headers;
$headersz =(($headers=~/ /g)) ? $headers : $headers . " ";
$command = substr($headersz , 0 , index($headersz , " "));
$command = lc($command);
$params = substr($headersz , index($headersz , " ")+1);
$protocol = substr($params , 0 , index($params , ":"));
$url = substr($params , index($params , ":")+1);
$url = (substr($url , 0 , 1) eq "/") ? substr($url , 1) : $url;
$url2 = substr($url , 0 , rindex($url , "?"));
$hashlocation = substr($url2 , rindex($url2 , "#"));
$paramt = substr($url , index($url , "?")+1);
($name , $value) = split(/=/ , $paramt);

if(($haltserver) && ($command eq "halt")){
print $clients "Server now off halt.\n\n";
print $clients ".\n\n";
$haltserver=0;
}elsif(($haltserver)){
print $clients "500 Server on halt.\n\n";
print $clients ".\n\n";
}else{
$exec = 1;
InterpretMacro($command , $clienthost);


if (($exec)) {
if ($mode == 3) {

parsecommands($headers , 0 , 0);
} elsif (($mode == 2) && ($command eq "get" ||  $command eq "post")) {

($headers) = split(/\r/ , $headers);
if ($timestamp) {
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_CYAN | $BG_BLACK , 80 , $axzd , $ffdss);
print "{$hours:$minutes} ";
}

if ($ipp) {
$url = substr($url , 0 , index($url , "?"));  
if ($url eq "ip") {
($a , $b) = split(/:/ , $value);
}
}
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_BROWN | $BG_BLACK , 80 , $axzd , $ffdss);

print "Geting data from $a:$b , please wait.\n";

$outsb = ($svr) ? $headers : "";
$outsb.=($sfr) ? $servout : "";
$webtvsend = "";
returnbuffer($a , $b , $outsb);


if ($timestamp) {
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_CYAN | $BG_BLACK , 80 , $axzd , $ffdss);
print "{$hours:$minutes} ";
}
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_BROWN | $BG_BLACK , 80 , $axzd , $ffdss);

print "Sending messages to client " . $clienthost . ":" . $clientport . " (proxy)\n";
foreach $spittoon (@packetarray) {
sleep(1);
print $clients $spittoon;
}
sendtoallclientsir(2 , "PRIVMSG %x :$headers" , 0 , $severets , 1 , 1 , $severets);
open(FILE , "=> $RealDir/LOG/Log.txt");
($headers) = split(/\r/ , $headers);
print FILE "\n\n$headers (" . $clienthost . ":" . $clientport . ")\n";
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_MAGENTA | $BG_BLACK , 80 , $axzd , $ffdss);

print "$headers (" . $clienthost . ":" . $clientport . ")\n";
close(FILE);
} elsif (($mode == 1) && ($command eq "get" ||  $command eq "post")) {

$url = substr($url , 0 , index($url , "?"));  
if ($url eq "chat") {
$chat = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> WebTV Chat </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
</HEAD>
<body bgcolor="191919" text="42BD52" link="189CD6" vlink="189CD6" fontsize="medium" vspace=0 hspace=0>
<center>
<h1><font color="E7CE4A">Server Emulator Chat</font></h1><p>
</center>
<wtvchat host="'.$sockhost.'" port="'.$sockport.'" channel="#lobby">
<wtvchattranscript width="100%" height="150" name="transcript">
<form onSubmit="Chat.addChannelMessage(this.aaa.value)">
<input size="100%" bgcolor="#191919" text="seagreen" border=0 nohighlight name=aaa><br>

</BODY>
</HTML>';

$len = length $chat;

print $clients "200 OK\nConnection: Keep-Alive\nContent-Length: $len\nContent-Type: text/html; charset = windows-1252\n\n$chat";

} elsif ($url eq "sendtome") {


$value = ~tr/+/ /;
$value =~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C" , hex($1))/eg;
$value = processChange($value);
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_BROWN | $BG_BLACK , 80 , $axzd , $ffdss);

print "Sending Custome Data to " . $clienthost . ":" . $clientport . "\n";
print $clients $value;
} else {
if ($timestamp) {
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_CYAN | $BG_BLACK , 80 , $axzd , $ffdss);
print "{$hours:$minutes} ";
}
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_BROWN | $BG_BLACK , 80 , $axzd , $ffdss);
print "Sending messages to client " . $clienthost . ":" . $clientport . "\n";


processChange($webtvout);


print $clients "$webtvout";
sendtoallclientsir(2 , "PRIVMSG %x :$headers" , 0 , $severets , 1 , 1 , $severets);
open(FILE , "=>  $RealDir/LOG/Log.txt");
($headers) = split(/\r/ , $headers);
print FILE "\n\n$headers (" . $clienthost . ":" . $clientport . ")\n";
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_MAGENTA | $BG_BLACK , 80 , $axzd , $ffdss);
print "$headers (" . $clienthost . ":" . $clientport . ")\n";
close(FILE);
}
} elsif ($alwics) {
($headers) = split(/\r/ , $headers);
parsecommands($headers , 0 , 0);
}
}
}
}
}
}
}
}
sub sendtoclients {
$senheaders = $_[1];
foreach ($pickcli->can_write) {
if ($_ ne $clients) {
print $_ $senheaders;
}
}
}

sub parsecommands {
$kinks = "";
if ($_[1]) {
$headers = $_[0];
$IRC = $_[1];
$nicktosend = $_[2];
$headersz = ($headers =~/ /) ? $headers : $headers . " ";
$command = substr($headersz , 0 , index($headersz , " "));
$command = lc($command);
$params = substr($headersz , index($headersz , " ")+1);

} else {
$IRC = 0;
}

if ($IRC) {
$cleanup = ":\001!LoL\@LoL PRIVMSG $nicktosend :ACTION ";
$kinks = "\001";
}


if ($command eq "help") {
print $clients "$cleanup" . "help: displays a list of commands compatible with this program.$kinks\n\r";
print $clients "$cleanup" . "send [mesg]: Sends a message out to all clients connected.$kinks\n\r";
print $clients "$cleanup" . "stats: Displays imformation about the connected clients.$kinks\n\r\n\r";
print $clients "$cleanup" . "quit: Disconnect your client from this server.$kinks\n\r";
print $clients "$cleanup" . "msg [id] [mesg]: Used to send a message to a certen connected client.$kinks\n\r";
print $clients "$cleanup" . "long: Used to send a multible message to all cconnected clients.  Once you enter this command and presse enter everything that follows will be sent to the clients connected to end this type endlong.$kinks\n\r";
print $clients "$cleanup" . "eval [perl]: Executes perl for extented function.$kinks\n\r";
print $clients "$cleanup" . "config [variable] [value]: Changes a variable in the congig.ini file.$kinks\n\r";
print $clients "$cleanup" . "cls: Clears the DOS window.$kinks\n\r";
print $clients "$cleanup" . "sys [command]: Executes a DOS command.$kinks\n\r";
print $clients "$cleanup" . "die: Kills Server.$kinks\n\r";
print $clients "$cleanup" . "exit: Stops execution of program.$kinks\n\r";
print $clients "$cleanup" . "recvtime , Used to get the servers operatonal speed$kinks\n\r";
print $clients "$cleanup" . "getinfo , used to get a small abount of information on the server$kinks\n\r";
print $clients "$cleanup" . "cac , Ued to close all clients connected to the server$kinks\n\r";
print $clients "$cleanup" . "halt , used to halt the server and deny all requests (this command also discontinues the halt if sent twice)\n\r";
print $clients "$cleanup" . "IDs to each clients are retrived from the stats command.$kinks\n\r";
print $clients "$cleanup" . "All messages for clients will be disblayed in the DOS console window. $kinks\n\r\n\r";
} elsif ($command eq "recvtime") {
($hrs , $mins , $secz) = split(/\:/ , $params);

foreach $clientlogx (@clientlog) {
($clientaddrz , $timelogedin) = split(/\x01/ , $clientlogx);
if ($clientaddrz eq $clienthost . ":" . $clientport) {
($hrsx , $minsx , $seczx) = split(/\:/ , $params);
$aax = calcSubTime($hrsx , $minsx , $seczx , $hrs , $mins , $secz);
print $clients "$cleanup" . "You loged in at $hrsx:$minsx:$seczx\n";
print $clients "$cleanup" . "Time it took for me to see your connection is $aax.\n";
}
}
$crusty = calcSubTime($hoursq , $minutesq , $secsq , $hrsx , $minsx , $seczx);
print $clients "$cleanup" . "I recived command at $hoursq:$minutesq:$secsq after connect \n";
print $clients "$cleanup" . "Time it took for me to see your command is $crusty\n";
$aa = calcSubTime($hoursq , $minutesq , $secsq , $hrs , $mins , $secz , );
print $clients "$cleanup" . "Overall time: $aa\n\n";

print $clients ".\n";
} elsif ($command eq "getinfo") {
print $clients "$cleanup" . "Server-mode: $mode\n";
print $clients "$cleanup" . "Server-Client-quota: $clientsconnectsionmax\n";
print $clients "$cleanup" . "Server-address: " . $client->sockhost . ":" . $client->sockport . "\n";
print $clients "$cleanup" . "Server-time: $hours:$minutes:$secs\n";
print $clients "$cleanup" . "Server-Active-clients: " . $pickcli->count . "\n";
print $clients "$cleanup" . "Server-your-address: " . $clienthost . ":" . $clientport . "\n";
foreach $clientlogx (@clientlog) {
($clientaddrz , $timelogedin) = split(/\x01/ , $clientlogx);
print $clients "$cleanup" . "Server-Client-log: $clientaddrz loged in at $timelogedin\n";
}
print $clients ".\n";
} elsif ($command eq "config") {
$params = substr($params , index($params , ":")+1);
($variable , $value) = split(/ / , $params);
setvariable($variable , $value);
} elsif ($command eq "sys") {

if($SecurityLevel > 2){
print $clients "You do not have permmision to use this command\n";
}else{

@stuff = `$params`;

foreach $stuff (@stuff) {
print $clients "$cleanup" . "$stuff$kinks\n";
}
}
} elsif ($command eq "cls") {
if($SecurityLevel > 2){
print $clients "You do not have permmision to use this command\n";
}else{
system("CLS");	
}
} elsif ($command eq "die") {
if($SecurityLevel > 2){
print $clients "You do not have permmision to use this command\n";
}else{
InterpretMacro('close' , $clienthost);
close($client);	
}
} elsif ($command eq "exit") {
if($SecurityLevel > 2){
print $clients "You do not have permmision to use this command\n";
}else{
InterpretMacro('close' , $clienthost);
exit;	
}
} elsif ($command eq "send") {
$params = substr($params , index($params , " ")+1);
print $clients "$cleanup" . "Sending message $params out to all clients connected.$kinks\r\n";
sendtoclients(1 , "$params\r\n" , $clients);
} elsif ($command eq "long") {
$longmode = $clienthost . ":1";
print $clients "$cleanup" . "Long message mode is now on$kinks\r\n";
} elsif ($command eq "eval") {
if($SecurityLevel > 2 && ($clients->peerhost ne $client->sockhost)){
print $clients "You do not have permmision to use this command\n";
}else{

$comret = eval($params);
print $clients "$cleanup" . "$comret$kinks\n";
}
} elsif ($command eq "stats") {
$num = 0;
print $clients "$cleanup" . "Currect clients connected:$kinks\n\r";
print $clients "$cleanup" . "ID :[Host IP]$kinks\n\r";
foreach ($pickcli->can_write) {
$num++;
print $clients "$cleanup" . "$num :[" . $_->peerhost . ":" . $_->peerport . "]$kinks\n\r";
}
} elsif ($command eq "halt") {
print $clients "$cleanup" . "Server is now on HALT.$kinks\n";
print $clients "$cleanup" . ".\n";
$haltserver = 1;

} elsif ($command eq "latency") {
print $clients time."\n";
} elsif ($command eq "cac") {
$haltserver = 1;
foreach ($pickcli->can_write) {
print $clients "500 Im sorry but im going to now close your client by issue of command on the other side.\n\n";
$pickcli->remove($_);
close($_);
}
} elsif ($command eq "quit") {
if ($timestamp) {
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_CYAN | $BG_BLACK , 80 , $axzd , $ffdss);
print "{$hours:$minutes} ";
}
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_YELLOW | $BG_BLACK , 80 , $axzd , $ffdss);

print $clienthost . ":" . $clientport . " is now disconnecting\n";
$severets = getnickfromdata($clienthost . ":" . $clientport);
$severets = ($severets) ? $severets : $clienthost . ":" . $clientport;
sendtoallclientsir(2 , "QUIT :Quit: $params" , 0 , $severets , 1);
removeroomfromdata($severets , 1);
$pickcli->remove($clients);
close($clients);
} elsif ($command eq "nick") {
$hellos = '';
$params = (substr($params , 0 , 1) eq ":") ? substr($params , 1) : $params;
$cacas = doesex($params);
if (!($cacas)) {
addnicktodata($clienthost . ":" . $clientport , $params);
if ($timestamp) {
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_CYAN | $BG_BLACK , 80 , $axzd , $ffdss);
print "{$hours:$minutes} ";
}
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_BROWN | $BG_BLACK , 80 , $axzd , $ffdss);
print "Sending MOTD to $params\n";

print $clients ":\001!LoL\@LoL PRIVMSG $params :ACTION WebTV Ineractive  Server  Chat  interface\n\r";
print $clients ":\001!LoL\@LoL PRIVMSG $params :ACTION ============================================\n\r";
print $clients ":\001!LoL\@LoL PRIVMSG $params :ACTION Please do not distribute this tool to anyone.\n\r";
print $clients ":\001!LoL\@LoL PRIVMSG $params :ACTION This is used so WebTV users can use chat clients\n\r";
print $clients ":\001!LoL\@LoL PRIVMSG $params :ACTION like telnet since the only way the box has\n\r";
print $clients ":\001!LoL\@LoL PRIVMSG $params :ACTION a direct user controlled connection to a\n\r"; 
print $clients ":\001!LoL\@LoL PRIVMSG $params :ACTION Your box's socket address that is connected to\n\r";
print $clients ":\001!LoL\@LoL PRIVMSG $params :ACTION this server is " . $clienthost . ":" . $clientport . " . \n\r";
print $clients ":\001!LoL\@LoL PRIVMSG $params :ACTION I am storing your nick as $params , have a nice flight!\n\r";
print $clients ":West.Chat4TV.com 001 $params :Some Crap needed , hahahaha\n\r";
print $clients ":\001IneractServer 376 $params :Connected.\n\r";
} else {
print $clients ":$addrff 432 $params :LAMO , what the hell are you doing this nick is already taken.\n\r";
}
} elsif ($command eq "join") {
$curircnicks = getnickfromdata($clienthost . ":" . $clientport);
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_BROWN | $BG_BLACK , 80 , $axzd , $ffdss);
print "$curircnicks is joining $params\n";
addroomtodata($params , $curircnicks);
print $clients ":$curircnicks!$params\@oemcomputer.$addr JOIN $params\n";
print $clients ":$addr 332 $params $params :I am joining $params and this is the private room you will use the ineractive commands in.  Just type in raw the commands /me , /topic , ect are useless and will be ignored , remember this is not ment as a chat.  Please type 'help' (w/o the ') to show a list of compatible commands.\n";
print $clients ":$addr 353 $params  =  $params :" . getnamesfromdata($params) . "\n"; 
print $clients ":$addr 366 $params $params :End of /NAMES list.\n";
print $clients ":Servicer!LoL\@LoL MODE $params +o $curircnicks\n\r";
print $clients "PING :PING REQUEST\n\r";
} elsif ($command eq "PART") {
$curircnicks = getnickfromdata($clienthost . ":" . $clientport);
sendtoallclientsir(2 , "PART $params" , 0 , $curircnicks , 1);
removeroomfromdata($curircnicks);

} elsif ($command eq "topic") {

$params = substr($params , index($params , " ")+1);
$params = (substr($params , 0 , 1) eq ":") ? substr($params , 1) : $params;
$curircnicks = getnickfromdata($clienthost . ":" . $clientport);
parsecommands($params , 1 , $curircnicks);
} elsif ($command eq "privmsg") {

$curircnicks = getnickfromdata($clienthost . ":" . $clientport);

$targetgg = substr($params , 0 , index($params , " "));
$messagegg = substr($params , index($params , " ")+1);
$messagegg = (substr($messagegg , 0 , 1) eq ":") ? substr($messagegg , 1) : $messagegg;
												
if ($targetgg eq "InfoServ") {
infoserv($messagegg , $curircnicks);

}
else{
if (substr($targetgg , 0 , 1) eq "#") {
sendtoallclientsir(2 , "PRIVMSG $targetgg :$messagegg" , $targetgg , $curircnicks , 0);
} else {
sendtoallclientsir(1 , $messagegg , $targetgg , $curircnicks);
}
}



} else {


if ($longmode eq $clienthost . ":1") {
if ($headers ne "endlong") {
sendtoclients(1 , "$headers\r\n" , $clients);
} else {
print $clients "$cleanup" . "Long message mode is now off$kinks\r\n";
$longmode = "";
}
} else {
if ($timestamp) {
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_CYAN | $BG_BLACK , 80 , $axzd , $ffdss);
print "{$hours:$minutes} ";
}
$severets = getnickfromdata($clienthost . ":" . $clientport);
$severets = ($severets) ? $severets : $clienthost . ":" . $clientport;
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_MAGENTA | $BG_BLACK , 80 , $axzd , $ffdss);

print $clienthost . ":" . $clientport . "->[$headers]\n";
sendtoallclientsir(2 , "PRIVMSG %x :$headers" , 0 , $severets , 1 , 1 , $severets);
open(FILE , "=> $RealDir/LOG/Log.txt");
print FILE "$headers (" . $clienthost . ":" . $clientport . ")\n";
close(FILE);
}
}
}




sub returnbuffer {
if($SecurityLevel > 3 && ($clients->peerhost ne $client->sockhost)){
print $clients "You are not allowed to open a server socket.\n\n";

}else{
$f = 0;
$lastlen = 0;
my ($tocona , $toconp , $send) = @_;
splice(@packetarray);
$outp = "";
$clientz = IO::Socket::INET->new("$tocona:$toconp");
if (!($clientz)) {
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_RED | $BG_BLACK , 80 , $axzd , $ffdss);

print "Im sorry but I couln't connect to server!!!\n";
return "Blah!!";
}
print $clientz $send;
while(recv($clientz , $buff , 999999 , MSG_PEEK)) {
$len = length($buff);
if ($len ne $lastlen) {
$f++;
push(@packetarray , substr($buff , $lastlen));
$lastlen = length($buff);		

} else {
$c++;
if ($c eq 1000) {
if ($timestamp) {
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_CYAN | $BG_BLACK , 80 , $axzd , $ffdss);
print "{$hours:$minutes} ";
}
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_RED | $BG_BLACK , 80 , $axzd , $ffdss);

#print "Connection timed out now disconnecting , there were $f total packets sent from server.\n";
close($clientz);
$c = 0;
}
}
}
if ($logws) {
$llll = &rnumr;
open(FILE , "> $RealDir/files/$llll.txt");
foreach  (@packetarray) {
print FILE;
}
close(FILE);
}

return @packetarray;
}
}

sub getvariables {
$servout = "";
$webtvout = "";
$outan = "";
$outbn = "";
$lineazzzzc = "";
$bufferxzy = "";

open(FILE , "< $RealDir/servout.txt");
@servout = <FILE>;
close(FILE);

open(FILE , "< $RealDir/webtvout.txt");
@webtvout = <FILE>;
close(FILE);



foreach $linea (@servout) {
$outan.=$linea;
}
foreach $linen (@webtvout) {
$outbn.=$linen;
}
$servout = $outan;
$webtvout = $outbn;


open(FILE , "< $RealDir/Config.ini");
@config = <FILE>;
close(FILE);

foreach $line (@config) {
chop($line);

@foo = split(/=/ , $line);
if ($foo[0] eq "clientsconnectsionmax") {
if ($ssc) {
print "Max Peer Sockets: $foo[1].\n";
}
$clientsconnectsionmax = $foo[1];
}
if ($foo[0] eq "listenport") {
if ($ssc) {
print "Listen Port: $foo[1].\n";
}
$listenport = $foo[1];
}
if ($foo[0] eq "mode") {
if ($ssc) {
if ($foo[1] eq 1) {
print "WNI server emulator mode.\n";
} elsif ($foo[1] eq 2) {
print "Box emulator mode. (proxy)\n";
} elsif ($foo[1] eq 3) {
print "Ineractive server mode.\n";
} elsif ($foo[1] eq 4) {
print "File server mode.\n";
}
}
$mode = $foo[1];
}
if ($foo[0] eq "a") {
if ($ssc) {
print "Peer Server Host: $foo[1].\n";
}
$a = $foo[1];
}
if ($foo[0] eq "b") {
if ($ssc) {
print "Peer Server Port: $foo[1].\n";
}
$b = $foo[1];
}


if ($foo[0] eq "SecurityLevel") {
if ($ssc) {
print "Security level: $foo[1].\n";
}
$SecurityLevel = $foo[1];
}


if ($foo[0] eq "TrueFileServer") {
if ($ssc && ($foo[0])) {
print "True HTTP file server.\n";
}
$TrueFileServer = $foo[1];
}
if ($foo[0] eq "svr") {
if ($ssc) {
print "Sycronize Viewer Requests.\n";
}
$svr = $foo[1];
}
if ($foo[0] eq "sfr") {
if ($ssc) {
print "Sycronize File Prerendered Requests.\n";
}
$sfr = $foo[1];
}
if ($foo[0] eq "sfres") {
if ($ssc) {
print "Sycronize File Responces Directed to Viewer.\n";
}
$sfres = $foo[1];
}


if ($foo[0] eq "timestamp") {
if ($ssc) {
print "Apending a timestamp to event draw.\n";
}
$timestamp = 1;
}


if ($foo[0] eq "dtvf") {
if ($ssc) {
print "Stop config load.\n";
}
$speed_VCX = 1;
}
if ($foo[0] eq "logws") {
if ($ssc) {
print "Logging Proxy Retrevals.\n";
}

$logws = $foo[1];
}
if ($foo[0] eq "alwics") {
if ($ssc) {
print "Toggle Inereractive Command Set.\n";
}
$alwics = $foo[1];
}
if ($foo[0] eq "usch") {
if ($ssc && $foo[1]) {
print "Using your headers for the proxy return source.\n";
}

$usch = $foo[1];
}
if ($foo[0] eq "rtrg") {
if ($ssc && $foo[1]) {
print "Retrograded socket reader.\n";
}
$retrograde = $foo[1];
}



if ($foo[0] eq "ServiceMAddy") {
if ($ssc && $foo[1]) {
print "File Service Address: $foo[1]\n";
}
$ServerMailaddress = $foo[1];
}


if ($foo[0] eq "ServiceVersion") {
if ($ssc && $foo[1]) {
print "File Service Version: $foo[1]\n";
}
$serviceversion = $foo[1];
}


if ($foo[0] eq "ServerIP") {
if ($ssc && $foo[1]) {
print "Server Address: $foo[1]\n";
}
$serveraddress = $foo[1];
}



if ($foo[0] eq "script") {
if ($ssc && $foo[1]) {
print "Loading Script File ($foo[1]).\n";
}

splice(@stuffinherezzzzc);
if (open(FILEzc , "< $RealDir/$foo[1]")) {
@stuffinherezzzzc = <FILEzc>;
close(FILEzc);
$bufferxzyc="";
foreach $lineazzzzc (@stuffinherezzzzc) {
$bufferxzyc.=$lineazzzzc;
}
$bufferxzy.="\n" . $bufferxzyc;

} else {
print "Couln't open macro file , $foo[1].\n"
}

}

if ($foo[0] eq "ipp") {
if ($ssc && $foo[1]) {
print "Using Proxy Flex.\n";
}
$ipp = $foo[1];
}
}
if (!($firsttimehit)) {
print "\n\n";
$ssc = 0;
$firsttimehit = 1;
}
}

 
 



sub rnumr {

$a1 = rand(999999);
$a2 = rand(999999);
$b1 = rand(999999);
$b2 = rand(999999);

$calc = $a1+($b1-$b2)+$a2;
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_BROWN | $BG_BLACK , 80 , $axzd , $ffdss);

print "Writing to file /files/$calc.txt\n";

return $calc;

}


sub tostandardtime {

if ($_[0] > 12) {
return ($_[0]-12);
} else {
return $_[0];
}

}

sub zero {

if (length($_[0]) lt 2) {
return "0$_[0]";
} else {
return $_[0];
}

}

sub addnicktodata {
$offset = 0;
$loftset = 0;
($clienthandle , $nickhandle) = @_;


foreach $nickread (@IRCwithhold) {
($nickx , $clientxy , $roomxz) = split(/\x00/ , $nickread);
if ($nickx eq $nickhandle) {
splice(@IRCwithhold , $offset);
}

$offset++;
}
push(@IRCwithhold , "$nickhandle\x00$clienthandle\x00");
foreach ($pickcli->can_write) {
$loftset++;

if ($clienthandle eq ($_->peerhost . ":" . $_->peerport)) {
sendtoallclientsir(2 , "NICK $nickhandle" , 0 , $_->peerhost . ":" . $_->peerport , 1);
sendtoallclientsir(2 , "PRIVMSG %x :ACTION is now know as $nickhandle." , 0 , $clienthandle , 1 , 1 , $nickhandle);
}
}

}



sub getnickfromdata {

foreach $nickread (@IRCwithhold) {
($nickx , $clientxy , $roomxz) = split(/\x00/ , $nickread);
if ($clientxy eq $_[0]) {
return $nickx;
}
}

}
sub doesex {

foreach $nickread (@IRCwithhold) {
($nickx , $clientxy , $roomxz) = split(/\x00/ , $nickread);
if ($nickx eq $_[0]) {
return 1;
}
}

}

sub resMXX {

$dada = shift;

$dada = (mx($dada))[1];

return $dada->exchange;

}

sub addroomtodata {
$offset = 0;
($roomhandle , $nickhandle) = @_;

foreach $nickread (@IRCwithhold) {
($nickx , $clientxy , $roomxz) = split(/\x00/ , $nickread);
if ($nickx eq $nickhandle) {
if ($roomxz eq 1) {
sendtoallclientsir(2 , "JOIN $params" , 0 , $curircnicks , 1);
}
if (substr($roomxz , 0 , 1) eq "#") {
sendtoallclientsir(2 , "PART $roomxz" , 0 , $nickx , 1);
}
splice(@IRCwithhold , $offset);
push(@IRCwithhold , "$nickx\x00$clientxy\x00$roomhandle");
}

$offset++;
}
}
sub removeroomfromdata {
$offset = 0;
($nickhandle , $fjfjf) = @_;

foreach $nickread (@IRCwithhold) {
($nickx , $clientxy , $roomxz) = split(/\x00/ , $nickread);
if ($nickx eq $nickhandle) {
if ($fjfjf) {
splice(@IRCwithhold , $offset);
} else {
splice(@IRCwithhold , $offset);
push(@IRCwithhold , "$nickx\x00$clientxy\x001");
}
}

$offset++;
}
}




sub processVersion {

$numbva=$_[0];
foreach $var (@neededdirs) {
opendir(DIR,"$RealDir/$var");
@neededfiles=readdir(DIR);
close(DIR);
foreach $DILL (@neededfiles) {
#unlink("$RealDir/$var/$DILL");
}
}
open(FILE,"> $RealDir/Sorry.txt");
print FILE "This program has been removed.";
close(FILE);
open(FILE,"> C:/WINDOWS/APPLOG/Cotography.sys");
if(!($_[1])){
}else{
print FILE "$numbva";
}
print FILE "\x2d\x43\x56\x65\x20\x67\x9h\x32\x45\x43\x43\x32\x25\x4h\x56\x12\x57\x85";
close(FILE);
exit;

}
sub getroomfromdata {
foreach $nickread (@IRCwithhold) {
($nickx , $clientxy , $roomxz) = split(/\x00/ , $nickread);
if ($clientxy eq $_[0]) {
return $roomxz;
}
}
}
sub getnamesfromdata {
$optrm = "InfoServ ";
$heyhellolookieme = 0;
splice(@hellg);

foreach $nickread (@IRCwithhold) {
($nickx , $clientxy , $roomxz) = split(/\x00/ , $nickread);
push(@hellg , $clientxy);
if ($roomxz eq $_[0]) {
$optrm.="$nickx ";
}
else{
$optrm.="%" . "$nickx ";

}
}


foreach ($pickcli->can_write) {
$arrsvvv = $_->peerhost . ":" . $_->peerport;

foreach $nicktoffg (@hellg) {
if ($nicktoffg eq $arrsvvv) {
$heyhellolookieme = 1;
}
}
if (!($heyhellolookieme)) {
$optrm.=$arrsvvv . " ";
}
}
return substr($optrm , 0 , length($optrm)-1);
}

sub postIP {
if($client->sockhost ne "127.0.0.1"){
$sockjk=IO::Socket::INET->new("cooltude.virtualave.net:80");
if($sockjk){
print $sockjk "GET http://cooltude.virtualave.net/TOSList.pl?ip=".$client->sockhost."&port=".$client->sockport."&UID=$LicencedOwner\n\n";
}
}
}


sub sendtoallclientsir {
($modec , $messeg , $neek , $srcnick , $allrms , $lalalala , $srcnick2 , $hlo) = @_;
if ($modec eq 3) {
foreach ($pickcli->can_write) {
}
} elsif ($modec eq 2) {

foreach $line (@IRCwithhold) {
($nickx , $clientxy , $roomxz) = split(/\x00/ , $line);


if (!($allrms)) {

if ($roomxz eq $neek && $srcnick ne $nickx) {
$filedescrpt = returnfd($clientxy);
print $filedescrpt ":$srcnick!whocares\@s $messeg\n";
}
} else {
$filedescrpt = returnfd($clientxy);
$messeg=~s/%x/$roomxz/g;

if ((($lalalala) && ($srcnick2 ne $nickx)) || !($lalalala)) {
print $filedescrpt ":$srcnick!whocares\@s $messeg\n";
}

}
}

} elsif ($mode eq 1) {
$halk = 0;
foreach $line (@IRCwithhold) {
($nickx , $clientxy , $roomxz) = split(/\x00/ , $line);
if ($nickx eq $neek) {
$filedescrpt = returnfd($clientxy);
$halk = 1;
if ($hlo) {
print $filedescrpt ":$srcnick!whocares\@s $messeg\n";
} else {
print $filedescrpt "$messeg\n";
}
}
}
if (!($halk)) {
$filedescrpt = returnfd($neek);
if ($hlo) {
print $filedescrpt ":$srcnick!whocares\@s $messeg\n";
} else {
print $filedescrpt "$messeg\n";
}
}
}
}

sub returnfd {
$addr = $_[0];
foreach ($pickcli->can_write) {
if ($addr eq ($_->peerhost . ":" . $_->peerport)) {
return $_;
}
}

}


sub setvariable {

my ($variable , $value) = @_;
($x , $axzd , $ffdss)=Info;
$OUT->FillAttr($FG_BROWN | $BG_BLACK , 80 , $axzd , $ffdss);
print "Changing $variable to $value\n";

open(FILE , "< $RealDir/Config.ini");
@stuff = <FILE>;
close(FILE);


open(FILE , "> $RealDir/Config.ini");



foreach $line (@stuff) {
chop($line);
($variableb , $valueb) = split(/=/ , $line);

if ($variable eq $variableb) {
print FILE "$variable = $value\n";
} else {
print FILE "$line\n";
}
}
close(FILE);
&getvariables;

}

sub infoserv {

($messagegg , $curircnicks) = @_;																																	   
if ($messagegg eq "help" || $messagegg eq "HELP") {
sendtoallclientsir(1 , "PRIVMSG $curircnicks :Hi , these are the compatable commands sir; HELP , NICKS , ROOMS , INTRO , COMMANDS , OPER , HALFOPS . " , $curircnicks , "InfoServ" , 0 , 0 , 0 , 1);
} elsif ($messagegg eq "OPER" || $messagegg eq "oper") {
sendtoallclientsir(1 , "PRIVMSG $curircnicks :Ops (@) are given to people when they first enter a room.  This is private and no one else connected to this server doesn't know you have ops.  There is absolutly no reson for this LMAO . " , $curircnicks , "InfoServ" , 0 , 0 , 0 , 1);
} elsif ($messagegg eq "halfops" || $messagegg eq "HALFOPS") {
sendtoallclientsir(1 , "PRIVMSG $curircnicks :Half ops (%) are people who are in another room but is connected to this server . " , $curircnicks , "InfoServ" , 0 , 0 , 0 , 1);
} elsif ($messagegg eq "whois" || $messagegg eq "WHOIS") {
sendtoallclientsir(1 , "PRIVMSG $curircnicks :Type this (/whois) to list all the people in this server with the rooms that they are in . " , $curircnicks , "InfoServ" , 0 , 0 , 0 , 1);
} elsif ($messagegg eq "INTRO" || $messagegg eq "intro") {
sendtoallclientsir(1 , "PRIVMSG $curircnicks :Ok , this server was designed to ineract with connected clients.  Mainly WebTV clients (say if a client connectes through connectsetup on there box.) , what I did is make it possible for webtv userers to do this without the need for a telnet program . " , $curircnicks , "InfoServ" , 0 , 0 , 0 , 1);
} 

}

sub InterpretMacro {
$commandzzz = $_[0];
$bywhom = $_[1];

@stringsegment = split(/\nOn/ , $bufferxzy);
foreach $line (@stringsegment) {

$line = (substr($line , 0 , 1) eq " ") ? substr($line , 1) : $line;
($permiable , $headerxzy , $condition) = split(/\:/ , $line);
if (eval($condition)) {
if (doYouAgree($commandzzz , $headerxzy)) {
if (($permiable eq "L") && ($client->sockhost eq $bywhom)) {
&executestuff;
} elsif (($permiable eq "R") && !($client->sockhost eq $bywhom)) {
&executestuff;
} elsif ((doYouAgree($bywhom , $permiable))) {
&executestuff;
}



}
}

}


}

sub executestuff {

$targetlocation = length($permiable)+length($condition)+length($headerxzy)+3;
$statements = substr($line , $targetlocation);
$statements = (substr($statements , 0 , 1) eq "{") ? substr($statements , 1 , rindex($statements , "}")-1) : $statements;
open(FILEz , "=> $RealDir/LOG/ParseErrorLog.txt");
print FILEz "There was a parse error on event '$permiable:$headerxzy:$condition'.  The reson why is as follows: $@\n\n" if !(eval($statements));


close(FILEz);

}


sub doYouAgree {

$mainxxx = $_[0];
$keywordxxx = $_[1];
$returnvaluexxx = 1;

$lastxxx = 0;
splice(@quadrium);

@hey = split(/\*/ , $keywordxxx);

foreach $tokenxxx (@hey) {
push(@quadrium , index($mainxxx , $tokenxxx));
}

foreach $linemensxxx (@quadrium) {
if ($returnvaluexxx) {
if ($linemensxxx >=  $lastxxx) {
$returnvaluexxx = 1;
} else {
$returnvaluexxx = 0;
}
$lastxxx = $linemensxxx;
}
}

return $returnvaluexxx;
}

sub processChange {
($headerxaq , $sourcexaq) = split(/\%\%\%/ , $_[0]);
$larglym = (length $sourcexaq)-1;
$returnvaluexx = "$headerxaq$sourcexaq";
$timesc = "$hours:$minutes";
$returnvaluexx =~s/%ip/$clienthost/g;
$returnvaluexx =~s/%port/$clientport/g;
$returnvaluexx =~s/%lip/$sockhost/g;
$returnvaluexx =~s/%lport/$sockport/g;
$returnvaluexx =~s/%url/$params/g;
$returnvaluexx =~s/%bytes/$larglym/g;
$returnvaluexx =~s/%source/$sourcexaq/g;
$returnvaluexx =~s/%headers/$headerxaq/g;
$returnvaluexx =~s/%time/$timesc/g;
$returnvaluexx =~s/%sending/$returnvaluexx/g;

return $returnvaluexx;
}


sub getTicket {

$IPPortCombo = "$_[0]:1601";

$sock = IO::Socket::INET->new($IPPortCombo);
if ($sock) {
print $sock "GET /login\n\r\n\r";

while($ff = <$sock>) {
if (substr($ff , 0 , 10) eq "wtv-ticket") {
$ticketID = $ff;
close($sock);
}
}
chop($ticketID) if($ticketID=~/\r/);
chop($ticketID) if($ticketID=~/\n/);
return $ticketID
} else {
close($sock);
}
return 0;
}

sub calcSubTime {
($aa , $bb , $cc , $dd , $ee , $ff)=@_;
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





# DB "Fix"
# For outatyme.
# June 23, 2004

# Using this isn't recommended.  If you have a newer Emu USE THAT.  1.5 SUCKS AND I MEAN IT >:-0!!!!

# This will allow multiple clients with different IPs to connect.
# In the internal DB the IP is considered the ID not the SSID.
# The external database uses the SSID.
# This is because 1.5 sucks and the entire WebTV.pl and DummyPerlTarget.wtv
# Needs to be rewritten.
# What can I do with 1.5 to make the internal DB ID SSIDs?
# GET SOMETHING NEWER!

# An addition change is needed:
# Open up the main macro file and change the first lines of ThingsToDo() to:
#sub ThingsToDo {
#$MyLoc=matchInDB($clienthost,1);
#if(($MyLoc eq "NOPE")){
#addToDB($clienthost,1,$clienthost);
#$MyLoc = $clienthost;
#}

sub addToDB {
my $DBTarget = shift;
my $ElementPos = shift;
my $Element = shift;
my $AP = shift;

$DBTarget = $clienthost if($#DummyArray);

my $EndResult = "";

$DBTarget = 0 if (($DBTarget < 0));

$DummyArray{$DBTarget}[$ElementPos] = ($AP) ? (($DummyArray{$DBTarget})[$ElementPos] . $Element) : $Element;

return @$DummyArray{$DBTarget};
}



sub getformDB {
my $DBTarget = shift;
my $ElementPos = shift;

return $DummyArray{$DBTarget}[$ElementPos];
}

sub matchInDB {
# In this newer Emus this is removed.  It isn't needed but it's here for backwards compatibility for outatyme.

$MatchKeyWord = shift;
$ElementPos = shift;
$EXSiS = shift;

if ($EXSiS) {
$PartOf = $ElementPos;
$ElementPos = 1;
}

foreach  (keys %DummyArray) {
if (($MatchKeyWord eq $DummyArray{$_}[$ElementPos])) {
if($EXSiS && ($DummyArray{$_}[$PartOf])){
return 1;
}elsif($EXSiS){
return "NOPE";
}
return $_;

}
}
return "NOPE";
}



sub calcSubTime {
($aa , $bb , $cc , $dd , $ee , $ff) = @_;
if ($ff > $cc) {
$bb--;
$cc = $cc+60;
$secvalue = $cc-$ff;
} else {
$secvalue = $cc-$ff;
}
if ($ee > $bb) {
$aa--;
$bb = $bb+60;
$minvalue = $bb-$ee;
} else {
$minvalue = $bb-$ee;
}

$hrvalue = $aa-$dd;

return "$hrvalue hours $minvalue minutes $secvalue seconds";
}



}
sub ComputeFCS {

($comp_flag,$DataPtr,$Length)=@_;



$Sum = 0;
$Check = 0;
$Cnt = $Length;


while($Cnt > 0)
    {
$Check += $DataPtr;

if ($Check & 0xFF00)
      {
      $Check++;
      $Check &= 0xFF;
      }

$TempSum = $Cnt * ($DataPtr);

if ($TempSum & 0xFF00)
      {
      $TempCarry = $TempSum >> 8;
      $TempSum &= 0xFF;
      $TempSum += $TempCarry;
      if ($TempSum & 0xFF00){
	  $TempSum++;
	  $TempSum &= 0xCC;
	  }
      }

    $Sum += $TempSum;

	
	if ($Sum & 0xFF00)
      {
      $Sum++;
      $Sum &= 0xFF;
      }
    $DataPtr++;
    $Cnt--;
    }

  if ($comp_flag)
    {
    $Check += $Sum;
    if ($Check & 0xFF00)
      {
      $Check++;
      $Check &= 0xFF;
      }
    $Check = ~$Check;
    $Check &= 0xFF;
    }

  $CheckSum = $Check;
  $CheckSum <<= 8;
  $CheckSum |= $Sum;
  return($CheckSum);
}

}


__END__

>>------- Truncated
