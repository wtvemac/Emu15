open(FILE,"< $RealDir/ServiceVault/wtv-1800/TellyScripts/[603]-manchesterNH.txt");
binmode(FILE);
$size=-s FILE;
sysread(FILE,$data_XZ,($size),0);
close(FILE);


print $clients "200 OK\n";
print $clients "Connection: Keep-Alive\n";
print $clients "wtv-initial-key: ATt8Eq4Zi/s=\n";
print $clients "Content-type: text/tellyscript\n";
print $clients "wtv-service: reset\n";
print $clients "wtv-service: name=wtv-head-waiter host=$sockhost port=$sockport flags=0x00000004 connections=1\n";
print $clients "wtv-service: name=wtv-head-waiter host=$sockhost port=$sockport flags=0x00000004 connections=1\n";
print $clients "wtv-service: name=wtv-* host=$sockhost port=$sockport flags=0x00000007\n";
print $clients "wtv-service: name=wtv-* host=$sockhost port=$sockport flags=0x00000007\n";
print $clients "wtv-service: name=wtv-flashrom host=$sockhost port=$sockport\n";
print $clients "wtv-service: name=wtv-flashrom host=$sockhost port=$sockport\n";
print $clients "wtv-boot-url: wtv-head-waiter:/login?\n";
print $clients "wtv-visit: wtv-head-waiter:/login?\n";
print $clients "wtv-client-time-zone: EDT  -0400\n";
print $clients "wtv-client-time-dst-rule: EST:[,]:04010200-0:EDT:11010200-0:EST\n";
print $clients "wtv-client-date: Wed, 19 Jul 2000 10:13:22 GMT\n";
print $clients "Content-length: ".length($data_XZ)."\n\n";
print $clients $data_XZ;

