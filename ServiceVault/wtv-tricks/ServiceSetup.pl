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
if($namem eq "host"){
$hostticketh=$valuem;
}


if($namem eq "service"){
$srvcmessage=$valuem;
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


if(1){
if($srvcmessage){
print $clients "$srvcmessage\n\n";


}else{
if($hostticketh){
$hostticketh=getTicket($hostticketh);
$hostticketh="\n$hostticketh";
}
$tosendout=<<"ERIC"
<title>Services Setup</title>
<head>
<script>
coreda=0;
function addService(){
name=document.forms[0].elements[0].value
host=document.forms[0].elements[1].value
port=document.forms[0].elements[2].value
if(!(name) && !(host) && !(port)){

if(coreda){
thecoolval=document.forms[1].elements[0].value;
where=thecoolval.split("wtv-service: reset\n");
document.forms[1].elements[0].value=where[0]+where[1];
coreda=0;
}else{
thecoolval=document.forms[1].elements[0].value;
where=thecoolval.split("Content-length: 0\n");
document.forms[1].elements[0].value=where[0]+"Content-length: 0\nwtv-service: reset\n"+where[1];
coreda=1;
}

}else{
document.forms[1].elements[0].value+="wtv-service: name="+name+" host="+host+" port="+port+"\n";
}
}
</script>
</head>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>
<br>
<h1>Services Setup</h1>
<p>
To reset a service please add a service without any values.  This is the same to get rid of the reset.  Press "ticket" if you need a ticket to a service (the service is host value).  Please visit the <a href=client:showservicelist>Service List</a>.
<p>
<form>
<table><tr>
<th>Name</th>
<th>Host</th>
<th>Port</th>
<th></th>
</tr>
<td><input bgcolor="#191919" text="#44cc55" border=0></td>
<td><input bgcolor="#191919" name="host" text="#44cc55" border=0></td>
<td><input bgcolor="#191919" name="port" text="#44cc55" border=0></td>
<td><input type=button value="Add" onClick="addService()"></td>
<td><input type=submit value="Ticket"></td>
</form>
</table>
<p>
<form method="GET">
<textarea cols=100% rows="5" name="service" bgcolor="#191919" growable text="#44cc55"  border="0">500 Service List is now setup.
Content-length: 0$hostticketh
</textarea>
<p>
<input type=submit value="Do It!">
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


