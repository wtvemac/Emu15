$countxz=0;
$pastcontenttype=0;
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
$ReloginProne=0;
$FlashProne=0;
$DDProne=0;
$MWProne=0;

foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);
$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
#not going to bother with the other attributes, they have no concern over me.

if($namem eq "password"){
$passwordinput=$valuem;
}

}
$TUN=getUserName($userssid,1);

if($TUN ne "AccountDisabled" && ($TUN)){


$mailCount=getUserFile($userssid,"Mail/inbox/MailCount.txt");

$passwordtxt=getUserFile($userssid,"Preferences/Pass.txt");
chop($passwordtxt) if $passwordtxt=~/\n/;

if($passwordtxt && $passwordinput ne $passwordtxt){
print "\n$passwordinput\n";
print $clients "500 The password you entered is incorrect.  Please try again.\n";
print $clients "Connection: Keep-Alive\n\n";
print $clients "Content-length: 0\n";
print $clients "Content-type: text/html\n\n";
}else{

addToDB($MyLoc,8,getUserName($userssid,1));
$tosendout=<<"ERIC"
<html>
<title>Splash</title>
<display nostatus nooptions clearback switchtowebmode>
<body bgcolor="#000000" text="#449944">
<META HTTP-EQUIV=Refresh CONTENT="4;URL=wtv-home:/home">
<bgsound src="file://ROM/Sounds/Splash.mid">
<display nooptions nostatus skipback>
<center>
<spacer type=block height=118 width=21>
<img src="file://ROM/Images/MicrosoftName.gif"><img src="file://ROM/Images/MicrosoftR.gif"><br>
<img align=bottom src="file://ROM/Images/SplashLogo1.gif"><font color="#666666" size=0>TM</font>
<br><br>
<p><br>
<p><br>
</center>
</html>
ERIC
    ;



print $clients "200 OK\n";
#If I where to check for internet safety level (no mail, no chat, Kido, Surfwatch) then the service list will be change however there is not need for this in my server.
print "$UNN [$UHNF $UHNL] has logged in ($userssid)\n";

print $clients "200 OK\x0D\x0A";
#If I where to check for internet safety level (no mail, no chat, Kido, Surfwatch) then the service list will be change however there is not need for this in my server.
print $clients "Connection: Keep-Alive\x0D\x0A";
#print $clients "wtv-encrypted: true\x0D\x0A";
print $clients "wtv-country: US\x0D\x0A";
print $clients "wtv-language-header: en-US,en\x0D\x0A";
print $clients "wtv-visit: client:closeallpanels\x0D\x0A";
print $clients "wtv-expire-all: client:closeallpanels\x0D\x0A";
print $clients "wtv-client-time-zone: PST -0800\x0D\x0A";
print $clients "wtv-client-date: Mon, 25 Oct 1999 05:12:57 GMT\x0D\x0A";
print $clients "wtv-datadownload-url: wtv-disk:/download-list\x0D\x0A";
print $clients "wtv-datadownload-login-url: wtv-head-waiter:/login?DataDownload=1\x0D\x0A";
print $clients "wtv-datadownload-checktimeoffset: 22453\x0D\x0A";
print $clients "wtv-messagewatch-checktimeoffset: off\x0D\x0A";
print $clients "wtv-spotad-url: wtv-spot:/get-ad\x0D\x0A";
print $clients "wtv-spot-url: wtv-spot:/spot\x0D\x0A";
print $clients "wtv-spot-clickthru-url: wtv-spot:/ad-clickthrough?ad-click-ref=%s\x0D\x0A";
print $clients "wtv-spot-impression-time: 10\x0D\x0A";
print $clients "wtv-spot-minimum-time: 2\x0D\x0A";
print $clients "wtv-transition-override: normal\x0D\x0A";
print $clients "wtv-transition-page: wtv-home:/shared/transition/pageWithAd.html\x0D\x0A";
print $clients "wtv-force-lightweight-targets: webtv.net:/\x0D\x0A";
print $clients "wtv-spot-purge-queue: 0\x0D\x0A";
print $clients "wtv-spot-purge-queue: 1\x0D\x0A";
print $clients "wtv-name-server: 209.240.199.204\x0D\x0A";
print $clients "wtv-name-server: 209.240.199.203\x0D\x0A";
print $clients "wtv-smartcard-inserted-message: Contacting service\x0D\x0A";
print $clients "wtv-bypass-proxy: true\x0D\x0A";
print $clients "wtv-allow-dsc: true\x0D\x0A";

##############
#print $clients "wtv-ticket: j+9F5t3bqX9egVvTL7feQbQkzOoywsgs05kO86idgQUFwT1zxy2z9QmUiwsz3+CLF1poAMLOD0R+qFMgc5CZK58ejnXpXnXv9PEAVxBCZpXLF0oAw/K+jropjgtSgotZqMEZWtk2aWAfHQl4NaBLRzASwOHicLuhT/0Y0dgJzjOLxixfgRNTrscXibKonVYINnBR4GPL2ck8pLADOxdF4ZR5o8FtmUhnDSZ2T1O2K/Fi/yZZArKYWnt8h0Rdt2mpoYEa8Dl2Fa2SJNwnhdfP4jc16eKN0pmiU8844qLOZMGqh1hnGtF1b724luu87t7/J+e2o27ibLn2NShQL+C4i3zAMR8DIILAvKEkBsigryqw1qpYtuSRGpjCLc/TT4V0sww3qHkUw3v1yHqa07GGUob8HtyPBESR\x0D\x0A";
##############

print $clients "wtv-expire-all: wtv-head-waiter:/ValidateLogin\x0D\x0A";
print $clients "wtv-noback-all: wtv-\x0D\x0A";
print $clients "wtv-expire-all: wtv-head-waiter:/ValidateLogin\n";
print $clients "wtv-noback-all: wtv-\n";

###############################
print $clients "wtv-service: reset\n";
print $clients "wtv-service: name=wtv-aroundtown host=$sockhost port=$sockport flags=0x00000004 connections=3\n";
print $clients "wtv-service: name=wtv-* host=$sockhost port=$sockport flags=0x00000004\n";
print $clients "wtv-service: name=wtv-center host=$sockhost port=$sockport flags=0x00000004 connections=3\n";
print $clients "wtv-service: name=wtv-chat host=$sockhost port=$sockport flags=0x00000004 connections=3\n";
print $clients "wtv-service: name=wtv-content host=$sockhost port=$sockport flags=0x00000004 connections=3\n";
print $clients "wtv-service: name=wtv-cookie host=$sockhost port=$sockport flags=0x00000004 connections=1\n";
print $clients "wtv-service: name=wtv-disk host=$sockhost port=$sockport flags=0x00000004 connections=3\n";
print $clients "wtv-service: name=wtv-explore2 host=$sockhost port=$sockport flags=0x00000004 connections=3\n";
print $clients "wtv-service: name=wtv-explore host=$sockhost port=$sockport flags=0x00000004 connections=3\n";

print $clients "wtv-service: name=wtv-favorite host=$sockhost port=$sockport flags=0x00000004\n";
print $clients "wtv-service: name=wtv-mail host=$sockhost port=$sockport flags=0x00000004\n";
print $clients "wtv-service: name=wtv-tricks host=$sockhost port=$sockport flags=0x00000004\n";
print $clients "wtv-service: name=wtv-setup host=$sockhost port=$sockport flags=0x00000014 connections=3\n";
print $clients "wtv-service: name=wtv-home host=$sockhost port=$sockport flags=0x00000004 connections=2\n";
print $clients "wtv-service: name=wtv-head-waiter host=$sockhost port=$sockport flags=0x00000004 connections=1\n";

print $clients "wtv-service: name=wtv-benchmark host=$sockhost port=$sockport flags=0x00000004 connections=3\n";
print $clients "wtv-service: name=about host=$sockhost port=$sockport flags=0x00000004 connections=3\n";
print $clients "wtv-service: name=ROMCache host=$sockhost port=$sockport flags=0x00000004 connections=3\n";
print $clients "wtv-service: name=file host=$sockhost port=$sockport flags=0x00000004\n";
print $clients "wtv-service: name=wtv-flashrom host=$sockhost flags=0x00000004 port=$sockport\n";
print $clients "wtv-service: name=wtv-video host=$sockhost flags=0x00000004 port=$sockport\n";
print $clients "wtv-service: name=wtv-guide host=$sockhost port=$sockport flags=0x00000004 connections=3\n";
print $clients "wtv-service: name=wtv-music host=$sockhost port=$sockport flags=0x00000004 connections=1\n";
print $clients "wtv-service: name=wtv-intro host=$sockhost flags=0x00000004 port=$sockport\n";
print $clients "wtv-service: name=wtv-log host=$sockhost port=$sockport flags=0x00000004 connections=1\n";
print $clients "wtv-service: name=mailto host=$sockhost port=$sockport flags=0x00000004 connections=1\n";
print $clients "wtv-service: name=news host=$sockhost port=$sockport flags=0x00000004 connections=1\n";
print $clients "wtv-service: name=wtv-notices host=$sockhost port=$sockport flags=0x00000004 connections=1\n";
print $clients "wtv-service: name=wtv-onair host=$sockhost port=$sockport flags=0x00000004 connections=3\n";
print $clients "wtv-service: name=wtv-smartcard host=$sockhost port=$sockport flags=0x00000004 connections=1\n";
print $clients "wtv-service: name=wtv-spot host=$sockhost port=$sockport flags=0x00000004 connections=1\n";
print $clients "wtv-service: name=wtv-star host=$sockhost port=$sockport flags=0x00000004\n";
print $clients "wtv-service: name=wtv-forum host=$sockhost port=$sockport flags=0x00000004\n";
print $clients "wtv-service: name=wtv-news host=$sockhost port=$sockport flags=0x00000004 connections=3\n";
print $clients "user-id: 33884774214263188379\x0D\x0A";
print $clients "wtv-user-name: $UNN\x0D\x0A";
print $clients "wtv-human-name: $UHNF $HNL \x0D\x0A";
print $clients "wtv-irc-nick: $UNN\x0D\x0A";
print $clients "wtv-domain: $ServerMailaddress\x0D\x0A";
print $clients "wtv-expire-all: wtv-partner:/weather\n";
print $clients "wtv-expire-all: wtv-partner:/custom-info-teaser\n";
print $clients "wtv-expire-all: wtv-partner:/custom-info-page\n";
print $clients "wtv-expire-all: wtv-partner:/customize\n";
print $clients "wtv-expire-all: wtv-author:/scrapbookFiles\n";
print $clients "wtv-expire-all: wtv-author:/media\n";
print $clients "wtv-boot-url: wtv-head-waiter:/login\x0D\x0A";
print $clients "wtv-favorite-url: wtv-favorite:/favorite\x0D\x0A";
print $clients "wtv-favorite-index-url: wtv-favorite:/favorite-index?\x0D\x0A";
print $clients "wtv-home-url: wtv-log:/log\x0D\x0A";
print $clients "wtv-show-time-enabled: true\x0D\x0A";
print $clients "wtv-print-log-url: wtv-log:/log\x0D\x0A";
print $clients "wtv-mail-url: wtv-mail:/listmail\x0D\x0A";
print $clients "wtv-addresses-url: wtv-mail:/addresslist\x0D\x0A";
print $clients "wtv-notifications-url: wtv-notices:/notices\x0D\x0A";
print $clients "wtv-tvconnection-timeout: 86400\x0D\x0A";
print $clients "wtv-input-timeout: 600\n";
print $clients "wtv-inactive-timeout: 0\n";
print $clients "wtv-connection-timeout: 90\n";
print $clients "wtv-fader-timeout: 900\n";
print $clients "wtv-tourist-enabled: true\n";
print $clients "wtv-boot-url: wtv-head-waiter:/login\n";
print $clients "wtv-favorite-url: wtv-favorite:/favorite\n";
print $clients "wtv-favorite-index-url: wtv-favorite:/favorite-index?\n";
print $clients "wtv-home-url: wtv-star:/community\n";
print $clients "wtv-settings-url: wtv-setup:/get-settings\n";
print $clients "wtv-log-url: wtv-log:/log\n";
print $clients "wtv-show-time-enabled: true\n";
print $clients "wtv-print-log-url: wtv-log:/log\n";
print $clients "wtv-mail-url: wtv-mail:/listmail\n";
print $clients "wtv-addresses-url: wtv-mail:/addresslist\n";
print $clients "wtv-notifications-url: wtv-notices:/notices\n";
print $clients "wtv-messenger-login-url: wtv-passport:/messengerlogin\n";
print $clients "wtv-messenger-server: $sockhost\n";
print $clients "wtv-offline-mail-connect-url: wtv-head-waiter:/offline-mail-connect\n";
print $clients "wtv-ssl-log-url: wtv-log:/log\x0D\x0A";
print $clients "wtv-favorites-folders-url: wtv-favorite:/list-folders\x0D\x0A";
print $clients "wtv-smartcard-inserted-url: wtv-smartcard:/insert\x0D\x0A";
print $clients "wtv-smartcard-removed-url: wtv-smartcard:/remove\x0D\x0A";
print $clients "wtv-ssl-timeout: 240\x0D\x0A";
print $clients "wtv-login-timeout: 7200\x0D\x0A";
print $clients "wtv-open-isp-disabled: false\x0D\x0A";
print $clients "wtv-search-url: http://www.google.com/\x0D\x0A";
print $clients "wtv-phone-log-url: wtv-log:/phone-log\x0D\x0A";
print $clients "wtv-messenger-server: $ServerMailaddress\x0D\x0A";
print $clients "wtv-explore-url: wtv-explore2:/top\x0D\x0A";
print $clients "wtv-mail-count: 0\x0D\x0A";
print $clients "wtv-expire-all: wtv-mail:/listmail\x0D\x0A";
print $clients "wtv-demo-mode: 0\x0D\x0A";
print $clients "wtv-service-cookie: j+9F5t3bqX9egVvTL7feQbQkzOoywsgs05kO86idgQUFwT1zxy2z9QmUiwsz3+CLF1poAMLOD0R+qFMgc5CZK58ejnXpXnXv9PEAVxBCZpXLF0oAw/K+jropjgtSgotZqMEZWtk2aWAfHQl4NaBLRzASwOHicLuhT/0Y0dgJzjOLxixfgRNTrscXibKonVYINnBR4GPL2ck8pLADOxdF4ZR5o8FtmUhnDSZ2T1O2K/Fi/yZZArKYWnt8h0Rdt2mpoYEa8Dl2Fa2SJNwnhdfP4jc16eKN0pmiU8844qLOZMGqh1hnGtF1b724luu87t7/J+e2o27ibLn2NShQL+C4i3zAMR8DIILAvKEkBsigryqw1qpYtuSRGpjCLc/TT4V0sww3qHkUw3v1yHqa07GGUob8HtyPBESR\x0D\x0A";
#print $clients "wtv-lzpf: 0\x0D\x0A";
print $clients "wtv-visit: wtv-star:/community\x0D\x0A";

print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;
}
}