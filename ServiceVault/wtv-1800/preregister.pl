#Ok, this is definitly not how WNI does this.  Untill more information comes in this stays.

$countxz=0;
splice(@valueArray);
$pastcontenttype=0;

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

foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);
$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

if($namem eq "ethernet-ani"){
$PreRegANI=$valuem;
}

if($namem eq "manual-ani"){
$PreRegANI=$valuem;
}


}
$PreRegANI=~tr/\-//;


if(length($PreRegANI) == 10){

$AreaCode=substr($PreRegANI,0,3);
#$StateAreaCode=substr($PreRegANI,4,3);
if(!($AreaCodes{$AreaCode})){
$PreRegANI="";
}

}


if(!($PreRegANI)){
print $clients "200 OK\n";
print $clients "Content-length: 0\n";
print $clients "Content-type: text/html\n";
print $clients "wtv-expire-all: wtv-1800\n";
print $clients "wtv-visit: wtv-1800:/get-ani?t-baggage-parms=none\n\n";
}else{
print $clients "200 OK\n";
print $clients "Content-length: 0\n";
print $clients "Content-type: text/html\n";
print $clients "wtv-expire-all: wtv-1800\n";
print $clients "wtv-visit: wtv-1800:/have-ani?t-baggage-parms=ani%3D$PreRegANI\n\n";
}