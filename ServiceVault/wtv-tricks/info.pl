$tosendout="";
$ticketaccess="";
$trkdscommand="";

foreach $thethings (@headersforye) {
$countxz++;
if(lc(substr($thethings,0,index($thethings," "))) eq "wtv-ticket:"){
$ticketaccessz=substr($thethings,index($thethings," ")+1);
}
}
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
$thethings=substr($url,7);
@valueArray=split(/\&/,$thethings);
}





foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);

$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
if($namem eq "cmd"){
$trkdscommand=$valuem;
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
if(($trkaddress eq ($clienthost.":".$clientport)) || ($userssid eq $ssidx)){
$ticketaccess=$trkaccesslevel;
}
}
}
}
}




if(!($ticketaccess%15)){
$usernamexx=getUserName($userssid);
$axxx=getUserHumanNameF($userssid);
$bxxx=getUserHumanNameL($userssid);
$LastANI=getUserFile($userssid,"Preferences/ANI.txt");
$userhumannamexxx="$bxxx $axxx";
$tosendout=<<"ERIC"
<display nosave nosend skipback>
<title>WebTV Info</title>
<sidebar width=20%>
<img src="wtv-tricks:/images/About_bg.jpg">
</sidebar>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>
<br>
<br>
<br>
<h1>WebTV Info</h1>
<table>
<tr>
<td height=20>
<tr>
<td valign=top align=right><shadow>Connected to:</shadow>
<td width=10>
<td valign=top>(EricServ) Service
<tr>
<td valign=top align=right width=150><shadow>Service:</shadow>
<td width=10>
<td valign=top>$serviceversion
<tr>
<td valign=top align=right><shadow>Client:</shadow>
<td width=10>
<td valign=top>&vers; (Build $userclientbuild [Private])
<tr>
<td height=20>
<tr>
<td valign=top align=right><shadow>User name:</shadow>
<td width=10>
<td valign=top>$usernamexx ($userhumannamexxx)
<tr>
<td valign=top align=right><shadow>Silicon serial ID:</shadow>
<td width=10>
<td valign=top>$userssid
<tr>
<td valign=top align=right><shadow>Connected at:</shadow>
<td width=10>
<td valign=top>&rate;
<tr>
<td valign=top align=right><shadow>POP Number:</shadow>
<td width=10>
<td valign=top>&phone;
<tr>
<td valign=top align=right><shadow>Client IP number:</shadow>
<td width=10>
<td valign=top>$clienthost
<tr>
<td height=60>
<tr>
<td valign=top align=right><shadow>Last ANI:</shadow>
<td width=10>
<td valign=top>$LastANI
<tr>
<td valign=top align=right><shadow>Chip version: $userchipversion</shadow>
<td width=10>
<td valign=top>
<tr>
<td valign=top align=right><shadow>SysConfig: $usersysconfig</shadow>
<td width=10>
<td valign=top>
<tr>
<td valign=top align=right><shadow>Rom Type: $userromtype</shadow>
<td width=10>
<td valign=top>
<tr>
<td valign=top align=right><shadow>Boot Version: $userbootromversion</shadow>
<td width=10>
<td valign=top>
</table>
<pre>
</pre>
<br>
</body> </html>
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
<input type=hidden name=nextUrl value="wtv-tricks:/info">
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

