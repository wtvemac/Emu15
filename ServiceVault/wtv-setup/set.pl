$PrimeSetup="";


$countxz=0;
$pastcontenttype=0;
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
chop($qurey);
@valueArray=split(/\&/,$qurey);
}

$stuff=getUserFile($userssid,"Preferences/primesetup.txt");
@tidly=split(/\&/,$stuff);
foreach $UserSetup (@valueArray) {
($namem,$valuem)=split(/\=/,$UserSetup);
$PrimeSetup="";

foreach  (@tidly) {
($namemx,$valuemx)=split(/\=/,$_);
if($namemx eq $namem){
$PrimeSetup.="$namemx=$valuem$endXZ";
}else{
$PrimeSetup.="$namemx=$valuemx$endXZ";
}
}
@tidly=split(/\&/,$PrimeSetup);
}
addToUserFile($userssid,"Preferences/primesetup.txt",$PrimeSetup,1);
print $clients "200 OK\n";
print $clients "Content-Length: 0\n";
print $clients "Content-Type: text/plain\n\n";