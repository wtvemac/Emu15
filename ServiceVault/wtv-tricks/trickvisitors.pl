$HTMLforVTR=<<"ERIC"
<display nosave nosend>
<title>WebTV Tricks: Level 1</title>
<sidebar width=20%>
<img src="wtv-tricks:/images/Favorites_bg.jpg">
</sidebar>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>
<br>
<br>
<h1>Tricks Visits</h1>
<br>
ERIC
    ;


foreach $thethings (@headersforye) {
$countxz++;
if(lc(substr($thethings,0,index($thethings," "))) eq "wtv-ticket:"){
$ticketaccessz=substr($thethings,index($thethings," ")+1);
}
}

if(!($ticketaccess)){
if(open(FILEz,"< $RealDir/security/tricks.accessors")){
@stuffinherezzzz=<FILEz>;
close(FILEz);

foreach $lineazzzz (@stuffinherezzzz) {
chop($lineazzzz);
if((substr($lineazzzz,0,1)) ne "#"){
($trkaddress,$trkaccesslevel,$trktime,$ssidx)=split(/\x01/,$lineazzzz);
if($trkaddress eq ($clienthost.":".$clientport) || ($userssid eq $ssidx)){
$ticketaccess=$trkaccesslevel;
}
}
}
}
}


if(!($ticketaccess%30)){
if(open(FILEz,"< $RealDir/security/tricks.accessors")){
@stuffinherezzzz=<FILEz>;
close(FILEz);

foreach $lineazzzz (@stuffinherezzzz) {
chop($lineazzzz);
if((substr($lineazzzz,0,1)) ne "#"){
($trkaddress,$trkaccesslevel,$trktime,$ssidx)=split(/\x01/,$lineazzzz);
if($trkaddress eq ($clienthost.":".$clientport) || ($userssid eq $ssidx)){
$HTMLforVTR.="<b>$trkaddress ($ssidx,".getUserName($ssidx).") has accessed tricks level $trkaccesslevel at $trktime</b><p>";
}else{
$HTMLforVTR.="$trkaddress ($ssidx,".getUserName($ssidx).") has accessed tricks level $trkaccesslevel at $trktime<p>";
}
}
}
}
print $clients "200 OK\n";
print $clients "Content-length: ".length($HTMLforVTR)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $HTMLforVTR;
}else{
print $clients "500 Access Denied.\n\n";
}



