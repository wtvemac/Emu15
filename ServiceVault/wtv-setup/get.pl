$primeSetup=getUserFile($userssid,"Preferences/primesetup.txt");

print $clients "200 OK\n";
print $clients "Content-Length: ".length($primeSetup)."\n";
print $clients "Content-Type: text/plain\n\n";
print $clients $primeSetup;