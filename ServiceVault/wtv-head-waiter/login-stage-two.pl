chop($qurey);
@valueArray=split(/\&/,$qurey);
$ReloginProne=0;
$FlashProne=0;
$DDProne=0;
$MWProne=0;

foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);
$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
#not going to bother with the other attributes, they have no concern over me.

if($namem eq "relogin"){
$ReloginProne=$valuem;
}

if($namem eq "lc2flash"){
$FlashProne=$valuem;
}

if($namem eq "noflash"){
$noflash=$valuem;
}

if($namem eq "DataDownload"){
$DDProne=$valuem;
}

if($namem eq "MessageWatch"){
$MWProne=$valuem;
}

if($namem eq "ForceRegistration"){
$ForceReg=$valuem;
}

}

if($TUN ne "AccountDisabled" && ($TUN)){






if($FlashProne){
#Lets visit Flash.
addToDB($MyLoc,8,"Flash");
print $clients "200 OK\n";
print $clients "Connection: Keep-Alive\n";
print $clients "wtv-service: reset\n";
print $clients "wtv-service: name=wtv-home host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-aroundtown host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-register host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-1800 host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-mail host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-favorite host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-endocytosis host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-video host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-disk host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-head-waiter host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-* host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-log host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-flashrom host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-star host=$sockhost port=$sockport\n";
print $clients "wtv-expire-all: wtv-head-waiter:\n";
print $clients "Content-length: 0\n";
print $clients "Content-type text/html\n\n";
}elsif($DDProne){
#AaaHA! DataDownload, my bud.
print $clients "200 OK\n";
print $clients "Connection: Keep-Alive\n";
print $clients "wtv-service: reset\n";
print $clients "wtv-service: name=wtv-setup host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-video host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-disk host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-head-waiter host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-* host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-log host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-flashrom host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-star host=$sockhost port=$sockport\n";
print $clients "wtv-expire-all: wtv-head-waiter:\n";
print $clients "wtv-visit: client:fetch?source=wtv-disk:/download-list\n";
print $clients "Content-length: 0\n";
print $clients "Content-type: text/html\n\n";
addToDB($MyLoc,8,"DataDownload");
}elsif($MWProne){
#Oh goodie gum dropes lets just check for mail.
$mailCount=getUserFile($userssid,"Mail/inbox/MailCount.txt");
chop($mailCount) if $mailCount=~/\n/;print $clients "200 OK\n";
print $clients "Connection: Keep-Alive\n";
print $clients "wtv-service: reset\n";
print $clients "wtv-service: name=wtv-mail host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-setup host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-video host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-disk host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-head-waiter host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-* host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-log host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-flashrom host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-star host=$sockhost port=$sockport\n";
print $clients "wtv-mail-count: $mailCount\n";
print $clients "wtv-expire-all: wtv-head-waiter:\n";
print $clients "Content-length: 0\n";
print $clients "Content-type text/html\n\n";
}elsif($ForceReg){
addToDB($MyLoc,8,"Registration");


print $clients "200 OK\n";
print $clients "Connection: Keep-Alive\n";
print $clients "wtv-service: reset\n";
print $clients "wtv-service: name=wtv-head-waiter host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-* host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-log host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-flashrom host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-star host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-register host=$sockhost port=$sockport\n";
print $clients "wtv-client-time-zone: EDT  -0400\n";
print $clients "wtv-client-time-dst-rule: EST:[,]:04010200-0:EDT:11010200-0:EST\n";
print $clients "wtv-client-date: Wed, 19 Jul 2000 10:13:26 GMT\n";
print $clients "wtv-country: US\n";
print $clients "wtv-language-header: en-US,en\n";
print $clients "wtv-visit: client:closeallpanels\n";
print $clients "wtv-expire-all: client:closeallpanels\n\n";
print $clients "wtv-visit: wtv-register:/register\n";
print $clients "Content-length: 0\n";
print $clients "Content-type: text/html\n\n";


}else{

addToDB($MyLoc,8,"Demo");


$redirectXC="";
if(!($noflash)){

if(open(FILE,"< $RealDir/ServiceVault/wtv-head-waiter/LoginSetup.txt")){
@StuffInside=<FILE>;
close(FILE);
foreach  (@StuffInside) {
chop;
if(substr($_,0,1) ne "#" && ($_)){
($VariableX,$VariableComparative,$RedirectURL)=split(/\^/,$_);
if(doYouAgree(eval($VariableX),$VariableComparative)){
$redirectXC=eval($RedirectURL);
}
}
}
}
}

$passwordtxt=getUserFile($userssid,"Preferences/Pass.txt");
print "*$passwordtxt*\n\n";
chop($passwordtxt) if $passwordtxt=~/\n/;
print "*$passwordtxt*\n\n";
if($passwordtxt){
$redirectXC="wtv-head-waiter:/ValidateLogin?user-id=[ThisServerIsNotGoingToUseUIDs]";
}

if(!($redirectXC)){	   
$redirectXC="wtv-head-waiter:/ValidateLoginName?user-id=[ThisServerIsNotGoingToUseUIDs]";
}









print $clients "200 OK\n";
print $clients "Connection: Keep-Alive\n";
print $clients "wtv-client-time-zone: EDT  -0400\n";
print $clients "wtv-client-time-dst-rule: EST:[,]:04010200-0:EDT:11010200-0:EST\n";
print $clients "wtv-client-date: Wed, 19 Jul 2000 10:16:55 GMT\n";
print $clients "wtv-country: US\n";
print $clients "wtv-language-header: en-US,en\n";
print $clients "wtv-visit: client:closeallpanels\n";
print $clients "wtv-expire-all: client:closeallpanels\n";
print $clients "wtv-datadownload-url: wtv-disk:/download-list\n";
print $clients "wtv-datadownload-login-url: wtv-head-waiter:/login?DataDownload=1\n";
print $clients "wtv-datadownload-checktimeoffset: 12093\n";
print $clients "wtv-messagewatch-checktimeoffset: 4051\n";
print $clients "wtv-messagewatch-url: wtv-head-waiter:/login?MessageWatch=1\n";
print $clients "wtv-spotad-url: wtv-spot:/get-ad\n";
print $clients "wtv-spot-url: wtv-spot:/spot\n";
print $clients "wtv-spot-clickthru-url: wtv-spot:/ad-clickthrough?ad-click-ref=%s\n";
print $clients "wtv-spot-impression-time: 10\n";
print $clients "wtv-spot-minimum-time: 2\n";
print $clients "wtv-transition-override: normal\n";
print $clients "wtv-transition-page: wtv-home:/shared/transition/en-US/pageWithAd.html\n";
print $clients "wtv-force-lightweight-targets: webtv.net:/\n";
print $clients "wtv-spot-purge-queue: 0\n";
print $clients "wtv-spot-purge-queue: 1\n";
print $clients "wtv-name-server: 209.240.194.203\n";
print $clients "wtv-name-server: 209.240.194.204\n";
print $clients "wtv-smartcard-inserted-message: Contacting service\n";
print $clients "wtv-bypass-proxy: true\n";
print $clients "wtv-allow-dsc: true\n";
print $clients "wtv-offline-user-list: PHVzZXItbGlzdD4KPHVzZXIgdXNlcmlkPSIyODI0MDUxOTMiIHVzZXItbmFtZT0iZ3JpbWlvIiBmaXJzdC1uYW1lPSJTbnVnZ2xlLXd1Z2dsZSBRLiIgbGFzdC1uYW1lPSJTb3VzYXBob25lIiBwYXNzd29yZD0iIiBtYWlsLWVuYWJsZWQ9InRydWUiLz4KPC91c2VyLWxpc3Q+Cg==\n";
print $clients "wtv-visit: $redirectXC\n";
print $clients "Content-length: 0\n";
print $clients "Content-type: text/html\n\n";


}
}else{
print $clients "500 [YadaYadaYadaLaLaLa]\n";
print $clients "wtv-service: name=wtv-log host=$sockhost port=1618 flags=0x00000001 connections=1\n";
print $clients "wtv-log-url: wtv-log:/log\n";
print $clients "wtv-challenge: HA!!!\n";
}

