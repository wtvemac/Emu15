$countxz=0;
$ngname="";
$stuffsentoutX="";
$articlex="";
$pastcontenttype=0;
$goahead=0;
$ngsource=0;
$STUFF="";
$XmessageLength=0;
$XmessageOffset=0;
splice(@valueArray);
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
chop($qurey);
@valueArray=split(/\&/,$qurey);
}

foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);
$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

if($namem eq "group"){
$ngname=$valuem;
}

if($namem eq "source"){
$ngsource=$valuem;
}
if($namem eq "message_part_offset"){
$XmessageOffset=$valuem;
}

if($namem eq "message_part_length"){
$XmessageLength=$valuem;
}

if($namem eq "article"){
$articlex=$valuem;
}
}

if(($articlex) && ($ngname) && ($XmessageLength) && ($XmessageOffset)){


if(open(FILE,"< $RealDir//NewsGroups/$ngname/$articlex.txt")){
@stuffinside=<FILE>;
close(FILE);
foreach  (@stuffinside) {

$STUFF.=$_;
}
}
@NLARRAY=split(/\n/,substr($STUFF,$XmessageOffset,$XmessageLength));

foreach (@NLARRAY) {

if(!($goahead)){
if(substr($_,0,12) eq "ContentType:"){
$ContentTypeXX=substr($_,13);
}

if(length($_) == 0){
$goahead=1;
}
}else{
if(substr($_,0,7) ne "--WebTV"){
$stuffsentoutX.=$_;
}
}

}
if(!($ContentTypeXX)){
$ContentTypeXX="text/html";
}
$stuffsentoutX=~s/<href/<a href/g;
$stuffsentoutX=~s/<ahref/<a href/g;
$stuffsentoutX=~s/=([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

print $clients "200 OK\n";
print $clients "Content-length: ".length($stuffsentoutX)."\n";
if($ngsource){
print $clients "Content-type: text/plain\n\n";
}else{
print $clients "Content-type: $ContentTypeXX\n\n";
}
print $clients $stuffsentoutX;





}else{
print $clients "500 Missing Parimeters.\n\n";
}
 