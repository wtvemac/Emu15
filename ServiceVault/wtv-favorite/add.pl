$favimagecont="";
$pastcontenttype=0;
$favorite_title="";
$favorite_URL="";
splice(@FavArry);
$FolderName="";
$countxz=0;
foreach $thethings (@headersforye) {
$countxz++;

if(lc(substr($thethings,0,index($thethings," "))) eq "content-length:"){
$pastcontenttype=1;
}
if($countxz eq ($#headersforye)+1 && $pastcontenttype){
$favimagecont=$thethings;
}
}





splice(@valueArray);
chop($qurey);
@valueArray=split(/\&/,$qurey);


foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);


$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;


if($namem eq "favorite-title"){
$favorite_title=$valuem;
}

if($namem eq "favorite-url"){
$favorite_URL=$valuem;
}


if($namem eq "favorite-category"){
$FolderName=$valuem;
}


}




$DontGoFuther=0;
$username=getUserName($userssid);
if(open(FILE,"< UserDataBase/Users/$username/Favorites/$FolderName/origanized-.txt")){
sysread(FILE,$stuff,-s FILE,0);
@tidly=split(/\n/,$stuff);
close(FILE);


foreach  (@tidly) {
($x,$FavURL)=split(/\x00/,$_);
if($favorite_URL eq $FavURL){

$DontGoFuther=1;
}

}
}



if(!($DontGoFuther)){
if(!($FolderName)){
$stuff=getUserFile($userssid,"Favorites/FavData.txt");

foreach  (@tidly) {
chop;

if($_){
$CMD=substr($_,0,index($_," "));
if($CMD ne "FolderCount:"){
push(@FavArry,$_);
}
}
}

$FolderName=$FavArry[0];

}



$a1 = rand(999999);
$a2 = rand(999999);
$b1 = rand(999999);
$b2 = rand(999999);

$calc = $a1+($b1-$b2)+$a2;
open(FILE,"> $RealDir/UserDataBase/Users/$username/Favorites/$FolderName/Thumbnails/$calc.bmp");
binmode(FILE);
print FILE $favimagecont;
close(FILE);

if(!($favorite_title)){
$favorite_title="Untitled"
}   
open(FILE,">> $RealDir/UserDataBase/Users/$username/Favorites/$FolderName/origanized-.txt");
binmode(FILE);
print FILE "$favorite_title\x00$favorite_URL\x00$calc\n";
close(FILE);
}

print $clients "200 OK.\n";
print $clients "Content-length: 0\n";
print $clients "Content-type: text/html\n\n";