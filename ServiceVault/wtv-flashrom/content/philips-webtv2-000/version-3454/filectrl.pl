if(!($buffererd)){
print $client "500 What in the world are you doing? LoL!\n\n";
}
print $clients "200 OK\n";
print $clients "Content-Length: $messure\n";
print $clients "Content-Type: $contentTypes{$fileExt}\n\n";
print $clients $buffererd;