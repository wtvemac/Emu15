splice(@FavData);
$tosendout="";
$stuff=getUserFile($userssid,"Favorites/FavData.txt");
foreach  (@tidly){
chop;
if($_){
$CXZ=substr($_,0,index($_," "));

if($CXZ ne "FolderCount:"){
push(@FavData,$_);
}

}
}

@FavData=sort(@FavData);

foreach  (@FavData){
$tosendout.="$_\x00";
}

print $clients "200 OK\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/plain\n\n";
print $clients $tosendout;
