$countxz=0;
$pastcontenttype=0;
$groupinput="";
$datadownloadc="";
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


foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);
$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
if($namem eq "group"){
$groupinput=$valuem;
}

}


open(FILE,"DataDownload/$groupinput.txt");
sysread(FILE,$datadownloadc,-s FILE,0);
close(FILE);

print $clients "200 OK\n";
print $clients "Connection: Keep-Alive\n";
print $clients "Content-length: ".length($datadownloadc)."\n";
print $clients "Content-type: wtv/download-list\n\n";
print $clients $datadownloadc;
