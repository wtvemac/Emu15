$oneX="";
$twoX="";
($oneX,$twoX)=split(/\<\!-- view\=\"\%loc\" \!\>/,$buffererd);

print $clients "200 OK\n";
print $clients "Content-Length: $messure\n";
print $clients "Content-Type: $contentTypes{$fileExt}\n\n";
print $clients "$oneX$RealDir/ServiceValult/wtv-home/content/tourist.html$twoX";