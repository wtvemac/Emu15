$countxz=0;
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


}


if(!($filev)){
print $clients "500 Im sorry but I couldn't find cookie requested.\n\n";
}else{
$filestuff=getUserFile($userssid,"cookies/$filev.txt");
if(!($filestuff)){
print $clients "500 Im sorry but I couldn't find cookie requested.\n\n";
}else{
print $clients "200 OK\n";
print $clients "Content-Length: ".length($filestuff)."\n";
print $clients "Content-Type: text/plain\n\n";
print $clients $filestuff;
}
}

