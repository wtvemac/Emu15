$trkpassent="";
$trickshbe=0;
$trknextUrl="";
$countxz=0;
$pastcontenttype=0;



splice(@valueArray);
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
@valueArray=split(/\&/,$qurey);
}





foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);

$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
if($namem eq "password"){
$trkpassent=$valuem;
}


if($namem eq "nextUrl"){
$trknextUrl=$valuem;
}

}


if(!($trknextUrl)){
print $clients "500 WebTV ran into a technical problem.  Please try again.\n\n";
$closewhendone=1;

}elsif(!($trkpassent)){
print $clients "400 Please enter a password\n\n";
$closewhendone=1;


}else{
if(open(FILEz,"< $RealDir/security/tricks.passwords")){
@stuffinherezzzz=<FILEz>;					 
close(FILEz);

foreach $lineazzzz (@stuffinherezzzz) {
chop($lineazzzz);
if((substr($lineazzzz,0,1)) ne "#"){

($trkpass,$trkaccesslevel)=split(/\:/,$lineazzzz);
if($trkpass eq $trkpassent){
open(FILEz,">> $RealDir/security/tricks.accessors");
print FILEz $clienthost.":".$clientport."\x01$trkaccesslevel\x01$formateddate\x01$userssid\n";
close(FILEz);
print $clients "300 Moved.\n";
print $clients "Connection: Keep-Alive\n";
print $clients "Expires: Wed, 09 Oct 1991 22:00:00 GMT\n";
print $clients "wtv-tricks-access-level: $trkaccesslevel\n";
print $clients "wtv-bypass-proxy: true\n";
print $clients "wtv-expire-all: wtv-tricks\n";
print $clients "wtv-allow-dsc: true\n";
print $clients "wtv-ticket: $trkaccesslevel\n";
print $clients "Location: $trknextUrl\n\n";
$trickshbe=1;
}
}
}

}else{
print $clients "504 Password file is missing\n\n";
$closewhendone=1;
}

if(!($trickshbe)){

print $clients "400 Incorrect password.\n\n";
}

}






