$stuff=getUserFile($userssid,"Preferences/addressbook.txt");
$stuff.="\x00";
print $clients "200 OK\n";
print $clients "Content-length: ".length($stuff)."\n";
print $clients "Content-type: text/plain\n\n";
print $clients $stuff;
