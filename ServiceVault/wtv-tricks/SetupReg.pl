#!/usr/bin/perl

$IPxz="";
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
@valueArray=split(/\&/,$qurey);
chop($valueArray[$#valueArray]);
}

foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);
$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
if($namem eq "host"){
$IPxz=$valuem;
}
}
if($ticketXXX=getTicket($IPxz)){
print $clients "300 Moved.\n";
print $clients "wtv-service: reset\n";
print $clients "wtv-expire-all: wtv-register\n";
print $clients "wtv-service: name=wtv-1800 host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-tricks host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-register host=$IPxz port=1607\n";
print $clients "wtv-service: name=wtv-head-waiter host=$IPxz port=1601\n";
print $clients "wtv-service: name=wtv-flashrom host=$IPxz port=1618\n";
print $clients "$ticketXXX\n";
print $clients "Location: wtv-register:/ValidateSplash\n\n";
}else{
print $clients "500 No head waiter service/Ticket ID coresponding to this register server.\n\n";

}