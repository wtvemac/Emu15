splice(@FavData);
getUserFile($userssid,"Favorites/FavData.txt");
foreach  (@tidly){
chop;


if($_){
$CXZ=substr($_,0,index($_," "));
$CXZZ=substr($_,index($_," ")+1);

if($CXZ eq "FolderCount:"){
$FolderCount=$CXZZ;
}else{
push(@FavData,$_);
}
}


}

if($FolderCount > 1){
print $clients "300 OK\n";
print $clients "Content-length: 0\n";
print $clients "Content-type: text/html\n";
print $clients "wtv-expire-all: wtv-favorite\n";
print $clients "Location: wtv-favorite:/serve-folders?favorite-folder-name=$FavData[0]\n\n";

}else{
print $clients "300 OK\n";
print $clients "Content-length: 0\n";
print $clients "Content-type: text/html\n";
print $clients "wtv-expire-all: wtv-favorite\n";
print $clients "Location: wtv-favorite:/serve-browser?favorite-folder-name=$FavData[0]\n\n";



}
