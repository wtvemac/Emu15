$logtypex="";
$srvcmessage="";
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
if($namem eq "2"){
$srvcmessage=$valuem;
addToDB($MyLoc,2,$srvcmessage);
}

if($namem eq "3"){
$srvcmessage=$valuem;
addToDB($MyLoc,3,$srvcmessage);
}


if($namem eq "4"){
$srvcmessage=$valuem;
addToDB($MyLoc,4,$srvcmessage);
}


if($namem eq "5"){
$srvcmessage=$valuem;
addToDB($MyLoc,5,$srvcmessage);
}


if($namem eq "6"){
$srvcmessage=$valuem;
addToDB($MyLoc,6,$srvcmessage);
}


if($namem eq "7"){
$srvcmessage=$valuem;
addToDB($MyLoc,7,$srvcmessage);
}





}



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


if(!($ticketaccess%15)){

if($srvcmessage){
print $clients "500 Variables are set\nwtv-expire-all: wtv-\n\n";

}else{
$tosendout=<<"ERIC"
<title>User Variable Setup</title>
<head>
</head>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>
<br>
<h1>User Variable Setup</h1>
<p>
The variables below are used to indentify you from every other client.  These are used allot during server transactions.  <a href=wtv-tricks:/info>Info</a> shows allot of these variables.
<p>
<h4>Temporary Variables</h4>
<p>
These variables are cleared once your IP changes.
<p>
<table>
<form>
<tr>
<td>
SSID:
</td>
<td>
<input value="$userssid" name="2" bgcolor="#191919" text="#44cc55">
</td>
</tr>


<tr>
<td>
System Version:
</td>
<td>
<input value="$userclientbuild" name="3" bgcolor="#191919" text="#44cc55">
</td>
</tr>


<tr>
<td>
System config:
</td>
<td>
<input value="$usersysconfig" name="5" bgcolor="#191919" text="#44cc55">
</td>
</tr>



<tr>
<td>
Chip Version:
</td>
<td>
<input value="$userchipversion" name="4" bgcolor="#191919" text="#44cc55">
</td>
</tr>


<tr>
<td>
Boot Vers:
</td>
<td>
<input value="$userbootromversion" name="7" bgcolor="#191919" text="#44cc55">
</td>
</tr>


<tr>
<td>
Rom Type:
</td>
<td>
<input value="$userromtype" name="6" bgcolor="#191919" text="#44cc55">
</td>
</tr>
</table>
<p>
<input type="submit" value="Set These">
<p><br>
<h4>Fixed Variables</h4>
<p>
These variables are the variables stored on this server.  Be carefull the next time you log in you mite be sent to the registration screen if you set these variables incorectly.
<p>

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


