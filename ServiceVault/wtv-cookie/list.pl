
$filestuff=getUserFile($userssid,"cookies/list.txt");

print $clients "200 OK\n";
print $clients "Content-Length: ".length($filestuff)."\n";
print $clients "Content-Type: text/plain\n\n";
print $clients $filestuff;
