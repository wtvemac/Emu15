$tosendout="";
$gotodir="";
$seconddir="";
$sheot="";
splice(@valueArray);
$countxz=0;
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
if($namem eq "dir"){
$gotodir=$valuem;
}
if($namem eq "seconddir"){
$seconddir=$valuem;
}

}







if(!($gotodir)){
$sheot.="Pick the service you want to check out!<p>";

if(opendir(DIR,"ServiceVault")){
@List=readdir(DIR);
closedir(DIR);


foreach  (@List) {


if(!($_=~/\./)){

$tosendout.="<a href=wtv-tricks:/URLList?dir=$_>$_:</a><br>";
}

}
}else{
print "500 Somethings fucked here??\n\n";
}
}else{

$sheot.="Click the URL, and get yoursef out of here!<p>";



if(opendir(DIR,"ServiceVault/$gotodir")){
@List=readdir(DIR);
closedir(DIR);


foreach  (@List) {
if(!($seconddir)){
$coolprefix="$gotodir:/";
$overboat="";
}else{
$coolprefix=substr($gotodir,0,index($gotodir,"/")).":/".substr($gotodir,index($gotodir,"/")+1);
$overboat="/";
}

if(($_ ne "..") && ($_ ne ".")){

if(($_=~/filectrl\.pl/) && ($seconddir)){
$sheot.="This is a directory which is being controled by a control file<br>";


}elsif(($_=~/default.pl/) || ($_=~/default.txt/)){
$tosendout.="<a href=$coolprefix"."Default_X.>Default file</a><br>";
}elsif(($_=~/\.pl/) || ($_=~/\.txt/) && !($seconddir)){
$tosendout.="<a href=$coolprefix$overboat".substr($_,0,rindex($_,".")).">$coolprefix$overboat".substr($_,0,rindex($_,"."))."</a><br>";

}elsif(!($_=~/\./)){
$tosendout.="<a href=wtv-tricks:/URLList?dir=$gotodir/$_&seconddir=1>Directory -> $coolprefix$overboat$_/</a><br>";

}else{
$tosendout.="<a href=$coolprefix$overboat$_>$coolprefix$overboat$_</a><br>";
}

}

}
}else{
print "500 Somethings fucked here??\n\n";
}

}

$tosendoutc=<<"ERIC"

<html><head><title>Erics Rubles!</title></head><body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>

<br>
<br>
<h1>Erics Rubles!</h1>
<br>
$sheot
<p>
ERIC
    ;

$tosendout="$tosendoutc$tosendout";
print $clients "200 OK.\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Connection: Keep-Alive\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;
