$countxz=0;
splice(@valueArray);
$pastcontenttype=0;
$needvideoad=0;

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
$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

if($namem eq "request-videoad-playid"){
$needvideoad=1;
}
}
splice(@ADarray);
open(FILE,"< ServiceVault/wtv-spot/ADs.txt");
@tidly=<FILE>;
close(FILE);
foreach (@tidly){
if(substr($_,0,1) ne "#"){

$XZA=substr($_,index($_," ")+1);
$FCV=substr($_,0,index($_," "));
if($FCV eq "AddCount:" && (substr($_,0,1) ne "#")){
$randme=$XZA;
}else{
push(@ADarray,$_);
}
}
}
$phoey=rand($randme);
$RandNum=substr($phoey,0,index($phoey,"."));
$VALXZ=$ADarray[$RandNum];
($AdImage,$AdID)=split(/\:/,$VALXZ);
print $clients "200 OK\n";
print $clients "Connection: Keep-Alive\n";
print $clients "wtv-spot-queue-add: queue=1&adID=$AdID&creative=$AdImage&rand=$RandNum\n";
if($needvideoad){
print $clients "wtv-videoad-playid: 0000021102cbda8500000000\n";
print $clients "wtv-videoad-playname: convenience_small.mpg\n";
}
print $clients "Content-length: 0\n";
print $clients "Content-type: text/html\n\n";
