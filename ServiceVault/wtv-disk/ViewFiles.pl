$fileContent=getUserFile($userssid,"SyncUserFile.txt");


@stuffinside=split(/\n/,$fileContent);
$fileContent="";
foreach $thesteuf (@stuffinside) {
if(lc(substr($thesteuf,0,5)) eq "file:"){
$fileContent.="<table><tr><td><a href=$thesteuf>$thesteuf</a></td><td>&nbsp;&nbsp;<a href=wtv-disk:/DownloadScreen?operation=rm&path=$thesteuf>Del</a></td></tr></table><br>";
}else{
$fileContent.="$thesteuf<br>";
}
}

$tosendout=<<"ERIC"
<title>View Logs</title>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>
<br>
<h1>View Files</h1>
<p>
This is the responce from your box.  if you have "state: missing" than the directory or file is not there.  Mite want to reload if needed.
<p>
$fileContent
ERIC
    ;

print $clients "200 OK\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;




