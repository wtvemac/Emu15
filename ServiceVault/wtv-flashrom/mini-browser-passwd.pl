#!/usr/bin/perl

$pastcontenttype=0;
$password_x="";
$countxz=0;

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
$thethings=substr($url,21);
@valueArray=split(/\&/,$thethings);
}

foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);

$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
if($namem eq "password"){

$password_x=$valuem;
}

}

if($password_x eq "microsoft"){
print $clients "300 Moved.\n";
print $clients "Location: wtv-head-waiter:/indirect-login\n\n";
}else{
$randnum=(rand(3));
$randnum=substr($randnum,0,index($randnum,"."));
if($randnum eq 0){
print $clients "500 WRONG!\n\n";
}elsif($randnum eq 2){
print $clients "500 That is correct.  NOT!\n\n";
}else{
print $clients "500 Try that again, homeslice.\n\n";
}

}

