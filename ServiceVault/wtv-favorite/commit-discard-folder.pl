
$ThisfolderCount="";
$stuff=getUserFile($userssid,"Favorites/FavData.txt");
$Counta_x=0;
$username=getUserName($userssid);
$FolderName="";
chop($qurey);
@valueArray=split(/\&/,$qurey);


foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);


$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;


if(substr($namem,0,7) eq "Discard"){
$FolderName=substr($namem,7);
}


}



open(FILE,"> UserDataBase/Users/$username/Favorites/FavData.txt");

foreach  (@tidly){
chop;

if($_){
$CXZ=substr($_,0,index($_," "));
$CXZZ=substr($_,index($_," ")+1);

if($CXZ eq "FolderCount:"){

print FILE "FolderCount: ".(($CXZZ)-1)."\n";
}else{
if($_ ne $FolderName){
print FILE "$_\n";
}
}
}
}

close(FILE);

print $clients "300 OK\n";
print $clients "wtv-expire-all: wtv-favorite\n";
print $clients "Content-length: 0\n";
print $clients "Content-Type: text/html\n";
print $clients "Location: wtv-favorite:/serve-discard-folders\n\n";





