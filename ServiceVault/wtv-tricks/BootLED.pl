$BootLED="";
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
if($namem eq "BootLEDModify"){
$BootLED=$valuem;
}


}



foreach $thethings (@headersforye) {
$countxz++;
if(lc(substr($thethings,0,index($thethings," "))) eq "wtv-ticket:"){
$ticketaccessz=substr($thethings,index($thethings," ")+1);
}
}

if(!($ticketaccess)){
if(open(FILEz,"< $RealDir//security/tricks.accessors")){
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


if(!($ticketaccess%15)){
if($BootLED){
print $clients "500 All set my lad!\n";
print $clients "Content-length: 0\n";
print $clients "wtv-boot-message-led-state: $BootLED\n\n";



}else{

$tosendout=<<"ERIC"
<title>Boot LED Setup</title>
<head>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>
<br>
<h1>Boot LED Setup</h1>
<p>
This tricks page is used to setup the box's boot LED.  The box seams to have a setting probably contained within the TellyScript variables that defines how the Boot led is controled.  Now you ask me what the boot LED is.  The Boot LED is the L.E.D. that flashes while your box prepares to establish a connection with the server.<p>


<table>
<tr><td>Flash Speed:&nbsp;&nbsp;</td><td>
<form>
<select name="BootLEDModify">
<option value="on">on-normal
<option value="off">Off
<option value="blinkSlow">Blinking Slow
<option value="blinkFast">Blinking Fast
</select>

</td></tr>
</table>
<p>
<input type=submit value="Get to It!">
ERIC
    ;


print $clients "200 OK.\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;

}

}else{
print "500 Access denied.\n\n";
}


