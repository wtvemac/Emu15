
$url=~tr/+/ /;
$url=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
chop($url);
if($url eq "blank"){
$url=" ";
}

print $clients "200 OK\n";
print $clients "Content-length: ".length($url)."\n";
print $clients "Content-type: text/html\n\n";
print $clients "$url";