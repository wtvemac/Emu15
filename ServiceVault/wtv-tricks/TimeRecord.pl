splice(@valueArray);
$countxz=0;
$TimeRecord="";
foreach $thethings (@headersforye) {
$countxz++;
if(lc(substr($thethings,0,index($thethings," "))) eq "wtv-show-time-record:"){
@TimeRecord=split(/ /,substr($thethings,index($thethings," ")+1));
}

if($countxz eq ($#headersforye)+1 && $pastcontenttype){
@valueArray=split(/\&/,$thethings);
}
}

if(!($valueArray[0])){

@valueArray=split(/\&/,$qurey);
}




foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);

$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
}


$FFFF=0;
foreach $FFFV (@TimeRecord) {

$FFFF++;

if($FFFV%2){
if($FFFV > 60){
$DDDz=$FFFV/60;
$modolo=$DDDz%60;
$DDD="Your where on this page for $DDDz minutes ".$modolo." Seconds";
}else{
$DDD="Your where on this page for $FFFV Seconds";
}

$TimeRecord.=$DDD."<p>";
}else{
chop $FFFV;
$TimeRecord="Time Record For: $FFFV&gt;<br>".$TimeRecord."<p>";
}

}
print $clients "200 OK\n";
print $clients "Content-length: ".length($TimeRecord)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $TimeRecord;