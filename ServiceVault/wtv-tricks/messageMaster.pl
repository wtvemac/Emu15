$extrasym="";
$messagexz="";
$usernamex="";
$usernamex=getUserName($userssid);


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
$thethings=substr($url,14);
@valueArray=split(/\&/,$thethings);
}


foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);

$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
if($namem eq "message"){
$messagexz=$valuem;
}
}

if($messagexz){
$extrasym="Last message has been sent.";
$usernamex=getUserName($userssid);
open(FILE,">> $RealDir//MESSAGES.txt");
print FILE "A message has been sent in from $usernamex:\n$messagexz\n\n";
close(FILE);
foreach  (1..39489) {
print "\a";
}
print "A message has been sent to you!\n";

}


$tosendout=<<"ERIC"
<display nosave nosend>
<title>Message Master</title>
<sidebar width=20%>
<img src="wtv-tricks:/images/Favorites_bg.jpg">
</sidebar>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>
<br>
<br>
<h1>Message Master</h1>
<br>
Type your lovely message below and I will try to get ahold of the owner!  $extrasym
<p>
<form method="GET">
<textarea cols=100% rows="5" name="message" bgcolor="#191919" text="#44cc55"></textarea>
<p>
<input type=submit>
</from>
ERIC
    ;

print $clients "200 OK.\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "wtv-expire-all: wtv-tricks:/messageMaster\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;





