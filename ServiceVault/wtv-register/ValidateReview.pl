$countxz=0;
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
@valueArray=split(/\&/,$qurey);
chop($valueArray[$#valueArray]);
}

foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);


$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
if($namem eq "new-subscriber-id"){
$newuserssid=$valuem;
}

if($namem eq "subscriber-name-first"){
$decidedusernameF=$valuem;
}

if($namem eq "subscriber-name-last"){
$decidedusernameL=$valuem;
}

if($namem eq "user-name"){
$decidedusername=$valuem;
}
}


if(($userssid) && ($decidedusername) && ($decidedusernameF) && ($decidedusernameL)){
if(matchUsername($decidedusername)){
print $clients "500 User name aleady in registry.\n\n";
}else{

#Process for user database
open(FILE,">> $RealDir/UserDataBase/users.txt");
print FILE "$userssid:$newuserssid:$decidedusername:$decidedusernameF:$decidedusernameL\n";
close(FILE);
#Precess for user settings.
$rootdirxz="UserDataBase/Users/$decidedusername";

mkdir("$rootdirxz",1);
mkdir("$rootdirxz/Favorites",1);
mkdir("$rootdirxz/Favorites/Personal",1);
mkdir("$rootdirxz/Favorites/Personal/Thumbnails",1);




mkdir("$rootdirxz/cookies",1);
mkdir("$rootdirxz/Mail",1);
mkdir("$rootdirxz/Mail/outbox",1);
mkdir("$rootdirxz/Mail/inbox",1);
mkdir("$rootdirxz/Mail/sent",1);
mkdir("$rootdirxz/Mail/trash",1);
mkdir("$rootdirxz/Mail/mbox",1);
mkdir("$rootdirxz/ActivityLog",1);
mkdir("$rootdirxz/Preferences",1);


open(FILE,"> $RealDir/$rootdirxz/Mail/inbox/MailCount.txt");
print FILE "1\n";
close(FILE);


open(FILE,"> $RealDir/$rootdirxz/Mail/inbox/MailData.txt");
print FILE "1\x00Welcome to EricSrv\x00ubergeek03\@yahoo.com\x00$mounths/$days\n";
close(FILE);
open(FILE,"> $RealDir/$rootdirxz/Favorites/FavData.txt");

print FILE "FolderCount: 1\n\nPersonal\n";
close(FILE);


open(FILE,"> $RealDir/$rootdirxz/Favorites/Personal/origanized-.txt");
print FILE "Discovery\x00http://www.discovery.com\x00wtv-favorite:/canned/discovery.gif\n";
print FILE "PBS Onlibe\x00http://www.pbs.org\x00wtv-favorite:/canned/images/pbs_online.gif\n";
close(FILE);


$bgclr = "#191919";
$fgclr = "#42CC55";
open(FILE,"> $RealDir/$rootdirxz/Mail/inbox/1.txt");
print FILE "From: ubergeek03\@yahoo.com\n";
print FILE "To: $decidedusername\@$ServerMailaddress\n";
print FILE "Subject: Welcome to EricSrv\n";
print FILE "X-WebTV-Stationery: BGColor #171726; TextColor #D6D6D6\n";
print FILE "Date: $formateddate\n\n";
print FILE "--WebTV-Mail-9896-1069\n";
print FILE "Content-Type: Text/Plain; Charset=US-ASCII\n";
print FILE "Content-Transfer-Encoding: 7Bit\n\n";
print FILE "WELCOME TO THE WEBTV EMULATOR 1.5 SHOWCASING\n\nWelcome to EricSrv this service may contain mail but it doesn't provide a SMTP server.  You may send mail but you will not recive mail from outside servers (you will be able to send mail internally to other cooltude.webtv.com users).  Sorry for the inconvinence but this isn't a fully emulated WNI server.  When I figure out how the notify service operates you may have a SMTP server so you can recive and send mail.  At this point its useless unless there is one.  Anyways enjoy!  Please click the test link on the home page and procede to do what it tell there so I can test certen things on your box!!\n\n"; 


open(FILE,"> $RealDir/$rootdirxz/Mail/mbox/MailCount.txt");
print FILE "0";
close(FILE);

open(FILE,"> $RealDir/$rootdirxz/Mail/sent/MailCount.txt");
print FILE "0";
close(FILE);

open(FILE,"> $RealDir/$rootdirxz/Mail/trash/MailCount.txt");
print FILE "0";
close(FILE);


open(FILE,"> $RealDir/$rootdirxz/Preferences/ANI.txt");
print FILE "603-669-1234\n";
close(FILE);


open(FILE,"> $RealDir/$rootdirxz/Preferences/playlist.txt");
print FILE "wtv-music:/MusicCache/VUAS3177[1].mid\n";
print FILE "wtv-music:/MusicCache/billsbillsbills_destinyschild[1].mid\n";
print FILE "wtv-music:/MusicCache/saymyname_destinyschild[1].mid\n";
print FILE "wtv-music:/MusicCache/jumpinjumpin_destinyschild[1].mid\n";
print FILE "wtv-music:/MusicCache/Cool.mid\n";
print FILE "wtv-music:/MusicCache/Cool2.mid\n";
print FILE "wtv-music:/MusicCache/Cool3.mid\n";
print FILE "wtv-music:/MusicCache/Cool4.mid\n";
print FILE "wtv-music:/MusicCache/Cool5.mid\n";
print FILE "wtv-music:/MusicCache/Cool6.mid\n";
close(FILE);

open(FILE,"> $RealDir/$rootdirxz/Preferences/addresslist.txt");
close(FILE);


open(FILE,"> $RealDir/$rootdirxz/Preferences/primesetup.txt");
print FILE "from-server=1&setup-advanced-option=1&setup-play-bgm=0&setup-bgm-tempo=&setup-bgm-volume=100&setup-background-color=c6c6c6&setup-font-size=medium&setup-in-stereo=1&setup-keyboard=alphabetical&setup-link-color=2222bb&setup-play-songs=1&setup-play-sounds=1&setup-text-color=0&setup-visited-color=8822bb&setup-japan-keyboard=roman&setup-japan-softkeyboard=norm&setup-chat-access-level=0&setup-chat-on-nontrusted-pages=1&setup-tv-chat-level=0";
close(FILE);



print $clients "200 OK\n";
print $clients "Connection: Keep-Alive\n";
print $clients "wtv-encrypted: true\n";
print $clients "wtv-visit: client:killprotocols\n";
print $clients "wtv-boot-url: wtv-head-waiter:/login?new_registration=2\n";
print $clients "wtv-visit: wtv-head-waiter:/login?new_registration=1\n";
print $clients "Content-length: 0\n";
print $clients "Content-type: text/html\n";
print $clients "wtv-transition: light\n\n";

}
}else{
print $clients "500 WebTV ran into a technical problem.  Pleas try to register the correct way.\n\n";
}