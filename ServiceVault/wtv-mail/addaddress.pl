splice(@valueArray);
$ADBAction="";$ADBnick="";
$ADBAddy="";
$countxz=0;
$Endresult="";
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

if($namem eq "nickname"){
$ADBnick=$valuem;
}
if($namem eq "address"){
$ADBAddy=$valuem;
}


}


if(index($ADBAddy,"\@") == (-1)){
$ADBAddy.="\@$ServerMailaddress";
}


if((substr($ADBAddy,index($ADBAddy,"\@")+1) eq $ServerMailaddress) && !(matchUsername(substr($ADBAddy,0,index($ADBAddy,"\@"))))){
print $clients "300 OK\n";
print $clients "Location: client:showalert?message=The+E-mail+address+<b>$ADBAddy</b>+does+not+exsist+on+this server.\n\n";


}else{
if($ModifyMe){
$stuff=getUserFile($userssid,"Preferences/addressbook.txt");
@tidly=split(/\x00/,$stuff);
$CXZL=0;
$firsty="";
$FVC=0;
foreach $DDDC (@tidly) {
$CXZL++;
if(($CXZL)){
if(!($CXZL%2)){
$EmailZX=$DDDC;
$FVC++;
if($FVC > 1){
$firsty="\x00";
}


if((($EmailZX eq $ADBAddyX) && ($UsernameZX eq $ADBnickX))){
$Endresult.="$firsty$ADBnick\x00$ADBAddy";
}else{
$Endresult.="$firsty$UsernameZX\x00$EmailZX";
}

}else{
$UsernameZX=$DDDC;
}
}

}
addToUserFile($userssid,"Preferences/addressbook.txt","$Endresult",1);
$ModifyMe=0;

}else{

if(getUserFile($userssid,"Preferences/addressbook.txt")){
addToUserFile($userssid,"Preferences/addressbook.txt","\x00$ADBnick\x00$ADBAddy");
}else{
addToUserFile($userssid,"Preferences/addressbook.txt","$ADBnick\x00$ADBAddy",1);
}
}
print $clients "300 OK\n";
print $clients "wtv-expire-all: wtv-mail\n";
print $clients "wtv-addresses-url: wtv-mail:/addresslist\n";
print $clients "Location: wtv-mail:/addressbook\n\n";
}