$search="";
$countxz=0;
$pastcontenttype=0;
$RetireCachePage="";
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
if($namem eq "RetireCachePage"){
$RetireCachePage=$valuem;
}
if($namem eq "search"){
$search=$valuem;
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


$tosendout=<<"ERIC"
<title>Cached URL Expire Setup</title>
<head>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>
<br>
<h1>Cached URL Expire Setup</h1>
<p>
The box stores information received over the Internet in internal cache.  This cache may contain setting information given by the server i.e. cookie data, or box preferences (default text color ect...)  the cache may also contain data that is used for faster access instead of resorting to the server when the source to the page has already been given.  However there is a problem with doing this and not updating the cache when needed.  WNI as set up a header which expires cache data or reloads it.  If this technique wasn't possible then your mailbox will need to be reloaded every new mail or your favorites needs to be reloaded whenever a new folder has been added or a new favorite.  The following allows you to manually do this.  Remember WebTVs internal cache is cleared after the ROM image has been reloaded into RAM after shut off.  This is not to be confused with WebTVs.<p>
Theory(WBIP24)-When the WebTV receiver receives this header then it does a search within its <u>Cache List</u> not back list.  The back list contains URLs and is linked to the titles, thumbnails and recent data, no contents of the source are contained in the back list.  This search term does not have to be the full URL.  WebTV has set up its expire search so that any given part of a URL that matches to the search key term it will return true i.e. the search term wtv-home:/biggy both will return true for the following URLs: wtv-home:/biggy-strong and wtv-home:/biggy-stiff.  If a match is made then the process to expire the corresponding cache data is executed.<p>
Theory(WBIP24)-The box is programmed to execute a constant invisible loop which checks for missing cache pages and checks to see if it is possible to retrieve it.  If it is possible to retrieve them then the box will do what it has to do to cache this missing needed data.  Cache pages that are needed for the box to run properly would be user settings, cookie domain list, favorite list, and the background music list.  One way that the box required cache gets interupted is when the page is expired.  Since this loop is constant than the page will be requested again if it is possible to do so. 
<p>
<table>
<tr><td>Operation:&nbsp;&nbsp;</td><td>
<form method="POST">

<select name="RetireCachePage">
<option value="1">Expire all Pages that Match this
<option value="3">Reload all Pages that Match this
</select>
</td></tr>
<tr><td>URL Search</td><td><input bgcolor="#191919" text="#44cc55" name="search" select nohighlight border=0>
</td></tr>
</table>
<p>
<input type=submit value="Demolish">
ERIC
    ;


print $clients "200 OK.\n";
print $clients "wtv-expire-all: wtv-content\n";

if($RetireCachePage eq "1"){
print $clients "wtv-expire-all: $search\n"
}else{
print $clients "wtv-reload-all: $search\n"
}

print $clients "Content-length: ".length($tosendout)."\n";

print $clients "Content-type: text/html\n\n";
print $clients $tosendout;


}else{
print "500 Access denied.\n\n";
}


