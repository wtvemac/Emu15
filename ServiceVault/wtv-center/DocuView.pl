$thingssentout="";
$countxz=0;
$ROOT="";
$pastcontenttype=0;
$URLx="";
$CntType="text/html";
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

if($namem eq "root"){
$ROOT=$valuem;


if(index($ROOT,$RealDir) < 0){
$ROOT="$RealDir/$ROOT"
}
}

if($namem eq "url"){
$URLx=$valuem;
}

}

$thingssentout=<<"ERIC"
<title>Information Pages</title>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>

<br>
<h1>Information Pages</h1>
<p>
ERIC
    ;
if($ROOT){

if($URLx=~/:/ || substr($URLx,0,1) eq "#"){
$CntType="text/url";
$thingssentout=$URLx
}else{



$fileExt=substr("$ROOT$URLx",rindex("$ROOT$URLx",".")+1);

if($fileExt eq "$ROOT$URLx"){
if(opendir(DIR,$ROOT)){


@List=readdir(DIR);
closedir(DIR);
$ROOT=(substr($ROOT,length($ROOT)-1) eq "/") ? "$ROOT$URLx" : "$ROOT/";
$thingssentout.="<table cellpadding=2><tr><th>File</th><th>Size</th><th>Last Modified</td></tr>";
foreach  (@List) {
$fileExtl=substr($_,rindex($_,".")+1);

($x,$x,$x,$x,$x,$x,$x,$sizex,$x,$k)=stat("$ROOT$_");
$LMx=localtime($k);
if($fileExtl eq $_){
$FVC="/";
}else{
$FVC="";
}

$thingssentout.="<tr><td><a href=wtv-center:/DocuView?root=$ROOT$_$FVC>$_</a></td><td>$sizex</td><td>$LMx</td></tr>";



}
}else{

$thingssentout="Couln't open directory!\n"
}
}else{
$ROOTx=substr($ROOT,0,rindex($ROOT,"/")+1);

open(FILE,"< $ROOT$URLx");
binmode(FILE);
$size=-s FILE;
sysread(FILE,$VBN,$size,0);
close(FILE);
$CntType=$contentTypes{$fileExt};
if(lc($CntType) eq "text/html"){

$VBN=~s/src=\"/src\=\"wtv-center\:\/DocuView\?root=$ROOTx\&url\=/g;
$VBN=~s/href=\"/href\=\"wtv-center\:\/DocuView\?root=$ROOTx\&url\=/g;

}
$thingssentout=$VBN;

}

}
}else{


$thingssentout.=<<"ERIC"
These pages are the pages that mite pose a varry handy resource when using this server.<p>
<a href=wtv-center:/DocuView?root=documentation/>Documentation Pages</a><br>
<a href=wtv-center:/DocuView?root=Information/>Information Pages</a><br>


ERIC
    ;

}
if(!($CntType)){
$CntType="text/html"
}
print $clients "200 OK\r\n";
print $clients "Content-Length: ".length($thingssentout)."\r\n";
print $clients "Content-Type: $CntType\r\n\r\n";
print $clients $thingssentout;

