splice(@MusicArry);
print $clients "200 OK\n";
print $clients "Connection: Keep-Alive\n";
print $clients "wtv-backgroundmusic-clear: no_zits\n";
getUserFile($userssid,"Preferences/playlist.txt");
foreach  (@tidly) {
if($_){
push(@MusicArry,$_);
}
}
$RandNumber=rand(($#MusicArry));
$RandNumber=substr($RandNumber,0,index($RandNumber,"."));

$RandSelection=$MusicArry[$RandNumber];


print $clients "wtv-backgroundmusic-add: $RandSelection\n";
print $clients "Content-lenght: 0\n";
print $clients "Content-type: text/html\n\n";

