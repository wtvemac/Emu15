#!/usr/bin/perl

splice(@valueArray);
foreach $thethings (@headersforye) {
$countxz++;
if(lc(substr($thethings,0,index($thethings," "))) eq "content-length:"){
$pastcontenttype=1;
}

if($countxz eq ($#headersforye)+1 && $pastcontenttype){
@valueArray=split(/\&/,$thethings);
chop($valueArray[$#valueArray]);
}
}
if(!($valueArray[0])){
@valueArray=split(/\&/,$qurey);
chop($valueArray[$#valueArray]);
}

foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);

print "*$namem*\n";
$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
if($namem eq "path"){
$PATHX=$valuem;
}
if($namem eq "operation"){
$operationz=$valuem;
}
}

$FileListSync="";
$countxz=0;
foreach $thethings (@headersforye) {
$countxz++;
if(lc(substr($thethings,0,index($thethings," "))) eq "content-length:"){
$pastcontenttype=1;
}
if($countxz eq ($#headersforye)+1 && $pastcontenttype){
$FileListSync=$thethings;
}
}
if($operationz eq "rm"){
$FileListSync="DELETE $PATHX\n\n";
print $clients "200 OK.\n";
print $clients "Content-length: ".length($FileListSync)."\n";
print $clients "Content-type: wtv/download-list\n\n";
print $clients $FileListSync;
print "$FileListSync\n\n";
}elsif($operationz eq "exe"){
$FileListSync="EXECUTE $PATHX\n\n";
print $clients "200 OK.\n";
print $clients "Content-length: ".length($FileListSync)."\n";
print $clients "Content-type: wtv/download-list\n\n";
print $clients $FileListSync;
}elsif($operationz eq "mkdir"){
$FileListSync="CREATE $PATHX\npartition-size: 41943040\n\nlist wtv-disk:/log-delete?logfunction=logstore\nroot: file://Disk/Browser/Logs/Games/\n\n";
print $clients "200 OK.\n";
print $clients "Content-length: ".length($FileListSync)."\n";
print $clients "Content-type: wtv/download-list\n\n";
print $clients $FileListSync;
}else{
print $clients "500 There is no information in the item chosed.\n\n";
addToUserFile($userssid,"SyncUserFile.txt","$FileListSync\n",1);
}