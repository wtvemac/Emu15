splice(@valueArray);
foreach $thethings (@headersforye) {
$countxz++;


if(lc(substr($thethings,0,index($thethings," "))) eq "authorization:"){
$Encrpt=substr($thethings,index($thethings," ")+7);
}


}

print "*$Encrpt*\n";

$tosendout="Heggggy";

print $clients "401 WebTV ran into a technical problem. Please try again.\n";
print $clients "Connection: Keep-Alive\n";
print $clients "WWW-Authenticate: Basic realm=EricSrv-Emulator-Access\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout
