$rtn=substr($url2,index($url2,"/")+1);

splice(@valueArray);
chop($qurey);
@valueArray=split(/\&/,$qurey);


foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);


$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;


if($namem eq "folder"){
$FolderName=$valuem;
}


}


$username=getUserName($userssid);

if(open(FILE,"< UserDataBase/Users/$username/Favorites/$FolderName/Thumbnails/$rtn")){
binmode(FILE);
sysread(FILE,$stuff,-s FILE,0);
close(FILE);

if(!($stuff)){
print $clients "500 No thumbnail bitmap data.";
}else{

print $clients "200 OK\n";
print $clients "Content-length: ".length($stuff)."\n";
print $clients "Content-type: image/wtv-bitmap\n\n";
print $clients $stuff;

}

}else{
print $clients "500 Couln't open bitmap file.\n\n";
}