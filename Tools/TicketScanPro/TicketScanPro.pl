#!/usr/bin/perl

use IO::Socket;

print "-=Eric MacDonald's Ticket Scan=-\n\n";

Init();


sub ScanTicketRange {
$curIP=$_[0];
$toIP=$_[1];
$pings=$_[2];



for(;;){
for($vvv=0; $vvv < $pings; $vvv++){

$ticket=getTicket($curIP);
if($ticket){
open(FILE,">> TicketScan.txt");
print FILE $ticket;
close(FILE);
print $ticket;
}
}

if($curIP eq $toIP){
last;
}
$curIP=AddIP($curIP);
}
}


sub getTicket {

$IPPortCombo="$_[0]:1601";

$sock=IO::Socket::INET->new($IPPortCombo);
if($sock){
print $sock "GET /login\n\r\n\r";

while($ff=<$sock>){
if(substr($ff,0,10) eq "wtv-ticket"){
$ticketID=$ff;
close($sock);
}
}
return "Ticket for $IPPortCombo.\n$ticketID\n";
}else{
close($sock);
return 0;
}
return 0;
}


sub Init {
print "Starting IP: ";
$first=<STDIN>;
chop($first);

print "Ending IP: ";
$end=<STDIN>;
chop($end);

print "Pings Per Connection: ";
$pings=<STDIN>;
chop($pings);


if(!($pings) or !($first) or !($end)){
print "\nMissing data!\n";
Init();
}else{	  
ScanTicketRange($first,$end,$pings);
}
}

sub AddIP {
($a,$b,$c,$d)=split(/\./,$_[0]);
if($d eq 255){
print "\n";
print FILE "\n";
$d=0;
if($c eq 255){
print "\n";
print FILE "\n";
$c=0;
if($b eq 255){
print "\n\n";
print FILE "\n\n";
$b=0;
if($a eq 255){
print "\n\n";
print FILE "\n\n";
$a=0;
}else{
print "\n\n";
print FILE "\n\n";
$a++;
}
}else{
print "\n\n";
print FILE "\n\n";
$b++;
}
}else{
print "\n";
print FILE "\n";
$c++;
}
}else{
print "\n";
print FILE "\n";
$d++;
}
return "$a.$b.$c.$d";
}
