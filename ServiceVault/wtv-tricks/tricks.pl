$tosendout="";
$ticketaccess="";
$trkdscommand="";
$backpage=0;
foreach $thethings (@headersforye) {
$countxz++;
if(lc(substr($thethings,0,index($thethings," "))) eq "wtv-ticket:"){
$ticketaccessz=substr($thethings,index($thethings," ")+1);
}
}
splice(@valueArray);
$countxz=0;
$pastcontenttype=0;
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
chop($qurey);
@valueArray=split(/\&/,$qurey);
}



foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);

$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
if($namem eq "cmd"){
$trkdscommand=$valuem;
}


if($namem eq "backpage"){
$backpage=$valuem;
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
if(($trkaddress eq ($clientport.":".$clientport)) || ($userssid eq $ssidx)){
$ticketaccess=$trkaccesslevel;
}
}
}
}
}


if($backpage){

if($ticketaccess eq 30 && !($backpage gt 30)){
$extrametal="<a href=wtv-tricks:/tricks?backpage=15>Level 1</a> > <a href=wtv-tricks:/tricks?backpage=30>Level 2</a>";
$ticketaccess=$backpage;
}elsif($ticketaccess eq 60 && !($backpage gt 60)){
$extrametal="<p><a href=wtv-tricks:/tricks?backpage=15>Level 1</a> > <a href=wtv-tricks:/tricks?backpage=15>Level 2</a> > <a href=wtv-tricks:/tricks?backpage=60>Level 3</a>";
$ticketaccess=$backpage;
}else{
$backpage="";
$extrametal="";
}

}else{


if($ticketaccess eq 30){
$extrametal="<a href=wtv-tricks:/tricks?backpage=15>Level 1</a> > <a href=wtv-tricks:/tricks?backpage=30>Level 2</a>";
}elsif($ticketaccess eq 60){
$extrametal="<p><a href=wtv-tricks:/tricks?backpage=15>Level 1</a> > <a href=wtv-tricks:/tricks?backpage=15>Level 2</a> > <a href=wtv-tricks:/tricks?backpage=60>Level 3</a>";
}else{

$extrametal="";
}


}


if($ticketaccess eq 15){


$tosendout=<<"ERIC"
<display nosave nosend>
<title>WebTV Tricks: Level 1</title>
<sidebar width=20%>
<img src="wtv-tricks:/images/Favorites_bg.jpg">
</sidebar>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>

<br>
<br>
<h1>WebTV Tricks: Level 1</h1>
<br>
<table>
<tr>
<td colspan=3 height=6>
<tr>
<td><a href="wtv-tricks:/info">Info</a>
<td width = 25>
<td><a href="wtv-home:/content/tourist.html">Run a WWW Tour</a>
<tr>
<td colspan=3 height=6>
<tr>
<td><a href="wtv-log:/request-view-log">Roll them Logs!</a>
<td width = 25>
<td><a href="wtv-flashrom:/VendWillie">The Willies!</a>
<tr>
<td colspan=3 height=6>
<tr>
<td><a href="wtv-tricks:/blastbacklist">Blast Backlist</a>
<td width = 25>
<td><a href="wtv-tricks:/ServiceSetup">Service Setup</a>
<tr>
<td colspan=3 height=6>
<tr>
<td><a href="client:ResetNVAndPowerOff">Blast NVRAM</a>
<td width = 25>
<td><a href="client:showalert?message=You%20are%20about%20to%20%3Cb%3Eunregister%20this%20box.%3C%2Fb%3E%3Cp%3E%0AThe%20next%20person%20to%20use%20this%20box%20will%20have%20to%20sign%20up.&buttonLabel1=Cancel&buttonAction1=client:donothing&buttonLabel2=Unregister&buttonAction2=wtv-head-waiter:/unregister"
>Unregister This Box</a>
<tr>
<td colspan=3 height=6>
<tr>
<td><a href="wtv-tricks:/URLlist">Eric's Rubles</a>
<td width = 25>
<td><a href="wtv-tricks:/spots">Out, damn spot!</a>
<tr>
<td colspan=3 height=6>
<tr>
<td><a href="wtv-tricks:/stayconnected">Stayin' Alive</a>
<td width = 25>
<td><a href="wtv-disk:/content/Downloads.tmpl">Download-o-Rama</a>
<tr>
<td colspan=3 height=6>
<tr>
<td><a href="client:showservices">Show Services</a>
<td width = 25>
<td><a href="wtv-tricks:/VideoAds"></a>
<tr>
<td colspan=3 height=6>
<tr>
<td><a href="wtv-tricks:/ServiceSetup">Ticket Stuff</a>
<td width = 25>
</table>
<p>Can't get at what you want? Enter a password for greater access:
<br>
<br>
<form action="wtv-head-waiter:/tricks-passwd"
enctype="x-www-form-encoded" method="POST">
<input type=hidden name=nextUrl value="wtv-tricks:/tricks">
<input name="password" id="password"
bgcolor=#444444 text=#ffdd33 cursor=#cc9933
value="" type="password" size="16" maxlength="16">
<p>
$extrametal
</form>
</body>
ERIC
    ;

print $clients "200 OK.\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;

}elsif($ticketaccess eq 30){

$tosendout=<<"ERIC"
<display nosave nosend>
<title>WebTV Tricks: Level 2</title>
<sidebar width=20%>
<img src="wtv-tricks:/images/Favorites_bg.jpg">
</sidebar>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>
<br>
<br>
<h1>WebTV Tricks: Level 2</h1>
<br>
<table>
<tr>
<td colspan=3 height=6>
<tr>
<td><a href="wtv-tricks:/info">Info</a>
<td width = 25>
<td><a href="wtv-home:/content/tourist.html">NG Nuker</a>
<tr>
<td colspan=3 height=6>
<tr>
<td><a href="wtv-tricks:/RegityAnn">Regity Ann</a>
<td width=25>
<td><a href="wtv-tricks:/URLExpire">Expieration Setup</a>
<tr>
<td colspan=3 height=6>
<tr>
<td><a href="wtv-tricks:/blastbacklist">Preregistration Numba'</a>
<td width=25>
<td><a href="wtv-tricks:/BootLED">Boot LED Setup</a>
<tr>
<td colspan=3 height=6>
<tr>
<td><a href="client:ResetNVAndPowerOff">Message Puker</a>
<td width=25>
<td><a href="wtv-tricks:/trickvisitors">Trick or Treat</a>
<td width=25>
<tr>
<td colspan=3 height=6>
<tr>
<td><a href="wtv-tricks:/messageMaster">Message Master!</a>
<td width=25>

</table>
<p>Can't get at what you want? Enter a password for greater access:
<br>
<br>
<form action="wtv-head-waiter:/tricks-passwd"
enctype="x-www-form-encoded" method="POST">
<input type=hidden name=nextUrl value="wtv-tricks:/tricks">
<input name="password" id="password"
bgcolor=#444444 text=#ffdd33 cursor=#cc9933
value="" type="password" size="16" maxlength="16">
<p>


$extrametal
</form>
</body>
ERIC
    ;

print $clients "200 OK.\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Connection: Keep-Alive\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;


}elsif($ticketaccess eq 60){
$pwdx="";
$extra_x="";
$cmsann=substr($trkdscommand,0,index($trkdscommand," "));
$cmsaxnn=substr($trkdscommand,index($trkdscommand," ")+1);

if($cmsann eq "eval"){
$pwdx=eval($cmsaxnn);
}elsif($cmsann eq "cd"){
chdir($cmsaxnn);
}else{


$pwdx=`$trkdscommand`;
@arrayclause=split(/\n/,$pwdx);
$pwdx=join("</plaintext><p><plaintext>",@arrayclause);
}
$popa=cwd;

$tosendout=<<"ERIC"
<display nosave nosend>
<title>WebTV Tricks: Level 3</title>
<sidebar width=20%>
<img src="wtv-tricks:/images/Favorites_bg.jpg">
</sidebar>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>
<br>
<br>
<h1>WebTV Tricks: Command Prompt</h1>
<br>
> $popa<p>

<font size=-1>
$pwdx
</plaintext>
</font>
<br>
$extra

<br>

> $popa<p>

<table>
<tr>
<td colspan=3 height=6>
<tr>
<td width=100%>
<form action="wtv-tricks:/tricks" method="GET">
<input name="cmd" id="cmd"
bgcolor=#444444 text=#ffdd33 cursor=#cc9933
value="" type="text" size="100%" nohighlight selected>
</td></tr>
</table>
<p>Can't get at what you want? Enter a password for greater access:
<br>
<br>
<form action="wtv-head-waiter:/tricks-passwd"
enctype="x-www-form-encoded" method="POST">
<input type=hidden name=nextUrl value="wtv-tricks:/tricks">
<input name="password" id="password"
bgcolor=#444444 text=#ffdd33 cursor=#cc9933
value="" type="password" size="16" maxlength="16">
</form>
<p>
$extrametal
</body>
ERIC
    ;
print $clients "200 OK.\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Connection: Keep-Alive\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;


}else{


$tosendout=<<"ERIC"
<display nosave nosend skipback>
<title>WebTV Tricks Access</title>
<sidebar width=20%>
<img src="wtv-tricks:/images/About_bg.jpg">
</sidebar>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>
<br>
<font size="+2" color="E7CE4A"><blackface><shadow>
WebTV Tricks Access
</shadow></blackface></font>
<p>
Hello, citizen!
<p>
This feature is meant for use <b>only</b>
by employees of WebTV Networks, Inc.
and designated licensees.
<p>
All access to this page is monitored. Unauthorized access is a
<a href="wtv-home:/Credits-Legal">Terms of Service</a>
violation, and may result in immediate termination
of your service.
<p>
Remember, the computer is your friend.
<p>
<form action="wtv-head-waiter:/tricks-passwd"
enctype="x-www-form-encoded" method="POST">
<input type=hidden name=nextUrl value="wtv-tricks:/tricks">
<table>
<tr><td>User:
<td><input name="username" id="username" selected
bgcolor=#444444 text=#ffdd33 cursor=#cc9933
value="" type="text" size="16" maxlength="128">
<td>&nbsp;
<tr><td>Password:
<td><input name="password" id="password"
bgcolor=#444444 text=#ffdd33 cursor=#cc9933
value="" type="password" size="16" maxlength="16">
<td>&nbsp;<input type=submit value=" Enter ">
</table>



</form>
<p>
</body>
ERIC
    ;

print $clients "200 OK.\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Connection: Keep-Alive\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;


 
 }